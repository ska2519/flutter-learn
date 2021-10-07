/* eslint-disable require-jsdoc */
import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import {UserRecord} from 'firebase-functions/lib/providers/auth';
import axios from 'axios';

export const customTokenFromNaver = functions.https.onCall(
    async (data, context) => {
        const accessToken = data.accessToken;
        if (!accessToken) return {error: 'There is no token provided.'};

        return createFirebaseToken(accessToken)
            .then((firebaseToken) => {
                return {token: firebaseToken};
            })
            .catch((e) => {
                return {error: e.message ?? JSON.stringify(e)};
            });
    });

const naverRequestMeUrl = 'https://openapi.naver.com/v1/nid/me';


async function createFirebaseToken(naverAccessToken) {
    return requestMe(naverAccessToken).then((response) => {
        const body = response.data;
        const userId = `naver:${body.response.id}`;
        if (!userId) {
            throw new functions.https.HttpsError('not-found', 'There was no user with the given access token.', 'USER_NOT_FOUND');
        }

        const email = body.response.email;
        const nickname = body.response.nickname;
        const profileImage = body.response.profile_image;

        return fetchOrCreateUser(userId, email, nickname, profileImage);
    }).then((userRecord) => {
        const userId = userRecord.uid;
        return admin.auth().createCustomToken(userId, {provider: 'KAKAO'});
    });
}

async function requestMe(naverAccessToken: string) {
    return await axios({
        method: 'GET',
        headers: {
            'Authorization': 'Bearer ' + naverAccessToken,
            'X-Naver-Client-Id': 'fSZ1vHm0EqsXhc81ibr8',
            'X-Naver-Client-Secret': 'snmuHB5T9c',
        },
        url: naverRequestMeUrl,
    });
}

/**
     * updateOrCreateUser - Update Firebase user with the give email, create if
     * none exists.
     * @param  {String} userId        user id per app
     * @param  {String} email         user's email address
     * @param  {String} displayName   user
     * @param  {String} photoURL      profile photo url
     * @return {Promise<UserRecord>} Firebase user record in a promise
     */
function fetchOrCreateUser(userId: string, email: string, displayName: string, photoURL: string): Promise<UserRecord> {
    const updateParams = {
        email: email,
        displayName: displayName ?? '',
        photoURL: photoURL ?? '',
        provider: 'NAVER',
    };
    return admin.auth().getUserByEmail(updateParams['email'])
        .catch((error) => {
            if (error.code === 'auth/user-not-found') {
                updateParams['uid'] = userId;
                return admin.auth().createUser(updateParams);
            }
            throw error;
        });
}
