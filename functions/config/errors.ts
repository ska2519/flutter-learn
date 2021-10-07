import * as functions from 'firebase-functions';

export const Kakao_InvalidAppIdError = new functions.https.HttpsError('invalid-argument', 'The given token does not belong to this application or appId is not a number', 'INVALID_APP_ID');
export const Kakao_UserNotFoundError = new functions.https.HttpsError('not-found', 'There was no user with the given access token.', 'USER_NOT_FOUND');
export const Kakao_EmailNotVerifiedError = new functions.https.HttpsError('cancelled', 'The user must verify their email to be registered', 'EMAIL_NOT_VERIFIED');
export const Kakao_EmailAlreadyInUse = new functions.https.HttpsError('already-exists', 'The email address is already in use by another account.', 'EMAIL_ALREADY_IN_USE');
