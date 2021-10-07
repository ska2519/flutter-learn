import * as admin from 'firebase-admin';
import * as functions from 'firebase-functions';
import {UserRecord} from 'firebase-functions/lib/providers/auth';
import axios from 'axios';
import * as kakao from './kakao';
import {Kakao_InvalidAppIdError, Kakao_UserNotFoundError, Kakao_EmailNotVerifiedError, Kakao_EmailAlreadyInUse} from '../config/errors';

/**
 * customTokenFromKakao - Verifies kakao token then returns firebase token created
 *
 * @param  {any} data Data that contains parameters provided by the client app
 * @param  {functions.https.CallableContext} context  Access token from Kakao Login API
 *
 * @return {Promise<string>} Firebase token
 */
export const customTokenFromKakao = functions.https.onCall(async (data, context) => {
    const kakaoAppId = Number(functions.config().kakao.appid);
    const accessToken = data.accessToken;
    if (!accessToken) return {error: 'There is no token provided.'};

    return kakao
        .createFirebaseToken(kakaoAppId, accessToken)
        .then((firebaseToken) => {
            return {token: firebaseToken};
        })
        .catch((e) => {
            return {error: e.message ?? JSON.stringify(e)};
        });
});


// Kakao API request url to retrieve user profile based on access token
const baseUrl = 'https://kapi.kakao.com/';

const requestMeUrl = '/v2/user/me?secure_resource=true';
const accessTokenInfoUrl = '/v1/user/access_token_info';

/**
 * createFirebaseToken - returns Firebase token using Firebase Admin SDK
 *
 * @param  {number} appId                   Id of kakao app
 * @param  {string} kakaoAccessToken        Access token from Kakao Login API
 *
 * @return {Promise<string>}                Firebase token in a promise
 */
export const createFirebaseToken = async function(appId: number, kakaoAccessToken: string): Promise<string> {
    const tokenInfo = await validateToken(kakaoAccessToken);
    if (tokenInfo.appId !== appId) {
        throw Kakao_InvalidAppIdError;
    }
    const kakaoUser = await requestMe(kakaoAccessToken);
    if (kakaoUser.id === undefined || kakaoUser.id.length < 0) {
        throw Kakao_UserNotFoundError;
    }
    const userRecord = await fetchOrCreateUser(
        kakaoUser.id,
        kakaoUser.kakao_account.email,
        kakaoUser.kakao_account.is_email_verified,
        kakaoUser.kakao_account.profile.nickname,
        kakaoUser.kakao_account.profile.profile_image_url
    );
    return admin.auth().createCustomToken(userRecord.uid, {kakaoUID: userRecord.uid, provider: 'kakaocorp.com'});
};

interface TokenInfo {
    id: number;
    expiresInMillis: number;
    expires_in: number;
    app_id: number;
    appId: number;
}

/**
 * validateToken - Returns access token info from Kakao API
 *                 which checks if this token is issued by this application.
 *
 * @param {string} kakaoAccessToken Access token retrieved by Kakao Login API
 * @return {Promise<TokenInfo>}     Access token info
 */
export const validateToken = async function(kakaoAccessToken: string): Promise<TokenInfo> {
    const response = await axios({
        method: 'GET',
        headers: {Authorization: 'Bearer ' + kakaoAccessToken},
        baseURL: baseUrl,
        url: accessTokenInfoUrl,
    });
    return {...response.data};
};

interface KakaoUser {
    id: string; // 사용자 ID
    properties: Map<string, string>; // 추가 정보
    kakao_account: KakaoAccount;
    synched_at: Date;
    connected_at: Date;
}

interface KakaoAccount {
    id: string;
    profile: KakaoProfile;
    email: string;
    email_needs_agreement: boolean;
    is_email_valid: boolean;
    is_email_verified: boolean;
    age_range: string;
    age_range_needs_agreement: boolean;
    birthday: string; // 생일, MMDD 형식
    birthday_needs_agreement: boolean;
    birthday_type: string; // 생일 양력/음력 구분, 양력(SOLAR)/음력(LUNAR)
    birthyear: string; // 태어난 해, YYYY 형식
    birthyear_needs_agreement: boolean;
    gender: string; // 성별, female/male
    gender_needs_agreement: boolean;
    phone_number: string; // 전화번호, +00 00-0000-0000 또는 +00 00 0000 0000 형식, 국가마다 하이픈(-) 위치나 값 다를 수 있음
    phone_number_needs_agreement: boolean;
    ci: string; // 암호화된 이용자 확인 값 (본인인증으로 발급)
    ci_needs_agreement: boolean;
    ci_authenticated_at: string; // 본인인증기관이 CI를 발급한 시각, UTC (RFC3339 internet date/time format)
}

interface KakaoProfile {
    nickname: string; // 닉네임
    profile_image_url: string; // 프로필 이미지 URL, 640px * 640px 또는 480px * 480px
    thumbnail_image_url: string; // 프로필 미리보기 이미지 URL, 110px * 110px 또는 100px * 100px
    profile_needs_agreement: boolean; // 사용자 동의 시 프로필 제공 가능
}

/**
 * requestMe - Returns user profile from Kakao API
 *             API Doc: https://developers.kakao.com/tool/rest-api/open/v2/user/me/get
 *
 * @param  {string} kakaoAccessToken Access token retrieved by Kakao Login API
 * @return {Promise<Response>}      User profile response in a promise
 */
export const requestMe = async function(kakaoAccessToken: string): Promise<KakaoUser> {
    const response = await axios({
        method: 'GET',
        headers: {Authorization: 'Bearer ' + kakaoAccessToken},
        baseURL: baseUrl,
        url: requestMeUrl,
    });
    return {...response.data};
};

/**
 * fetchOrCreateUser - Create a new user if email is not given, since there is no other way to map users.
 * If email is not verified, make the user re-authenticate with other id.
 *
 * @param  {string} userId         user id per app
 * @param  {string} email          user's email address
 * @param  {boolean} emailVerified whether this email is verified or not
 * @param  {string} displayName    user
 * @param  {string} photoURL       profile photo url
 * @return {Promise<UserRecord>}   Firebase user record in a promise
 */
async function fetchOrCreateUser(userId: string, email: string, emailVerified: boolean, displayName: string, photoURL: string): Promise<UserRecord> {
    return await getUser(userId, email, emailVerified).catch(async (error) => {
        if (error.code === 'auth/user-not-found') {
            return admin.auth().createUser({uid: `kakao:${userId}`, displayName: displayName, email: email, photoURL: photoURL});
        }
        throw error;
    });
}
// .then(userRecord => linkUserWithKakao(kakaoUserId, userRecord));
// NOTE: We will not directly link account if there is existing email. Instead, we will throw error, so that we can give an option of signing-in with existing account or linking later.
//       This is same behaviour as google and facebook.


/**
 * getUser - Fetch firebase user with kakao UID first, then with email if no user was found.
 * Throw an error if email is not verified so that the user can re-authenticate.
 *
 * @param {number} kakaoUserId    user id per app
 * @param {string} email          user's email address
 * @param {boolean} emailVerified whether this email is verified or not
 * @return {Promise<UserRecord>}
 */
async function getUser(kakaoUserId: string, email: string, emailVerified: boolean): Promise<UserRecord> {
    return await admin.auth().getUser(`kakao:${kakaoUserId}`).catch(async (error) => {
        if (error.code === 'auth/user-not-found') {
            if (!email) {
                throw error; // cannot find existing accounts since there is no email.
            }
            if (!emailVerified) {
                throw Kakao_EmailNotVerifiedError;
            }
            const userRecord: UserRecord = await admin.auth().getUserByEmail(email);
            if (userRecord) {
                throw Kakao_EmailAlreadyInUse;
            }
        }
        throw error;
    });
}

/**
 * linkUserWithKakao - Link current user record with kakao UID
 * if not linked yet.
 *
 * @param {number} kakaoUserId
 * @param {admin.auth.UserRecord} userRecord
 * @return {Promise<UserRecord>}
 */
export const linkUserWithKakao = async function(kakaoUserId: string, userRecord: UserRecord): Promise<UserRecord> {
    if (userRecord.customClaims && userRecord.customClaims['kakaoUID'] === kakaoUserId) {
        return Promise.resolve(userRecord);
    }
    await admin.auth().setCustomUserClaims(userRecord.uid, {kakaoUID: kakaoUserId, provider: 'kakaocorp.com'});
    return userRecord;
};

/**
 * linkToCurrentUser - Link kakao account to currently signed-in user.
 *
 * @param {string} kakaoAccessToken     Access token for Kakao
 * @param {number} appId                Id of kakao app
 * @param {string} uid                  uid of current user
 */
// eslint-disable-next-line @typescript-eslint/explicit-module-boundary-types
export const linkToCurrentUser = async function(kakaoAccessToken: string, appId: number, uid: string) {
    return validateToken(kakaoAccessToken)
        .then((tokenInfo) => {
            if (tokenInfo.appId !== appId) {
                throw Kakao_InvalidAppIdError;
            }
            return requestMe(kakaoAccessToken);
        })
        .then(async (kakaoUser) => {
            const userId = kakaoUser.id;
            if (!userId) {
                throw Kakao_UserNotFoundError;
            }
            return admin
                .auth()
                .getUser(uid)
                .then((userRecord) => {
                    return linkUserWithKakao(userId, userRecord);
                })
                .catch((error) => {
                    throw error;
                });
        });
};

