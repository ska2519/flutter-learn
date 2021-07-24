// import * as functions from 'firebase-functions';

// Start writing Firebase Functions
// https://firebase.google.com/docs/functions/typescript

// export const helloWorld = functions.https.onRequest((request, response) => {
//     functions.logger.info('Hello logs!', {structuredData: true});
//     response.send('Hello from Firebase!');
// });
import * as admin from 'firebase-admin';
admin.initializeApp();

export {increaseUserCount} from './firestore';
export {decreaseUserCount} from './firestore';

export {increaseCommentCount} from './firestore';
export {decreaseCommentCount} from './firestore';

export {increaseReadUserCount} from './firestore';

export {increasePostCount} from './firestore';
export {decreasePostCount} from './firestore';

export {increasePostTagsCount} from './firestore';
export {decreasePostTagsCount} from './firestore';
export {updatePostTagsCount} from './firestore';

export {increasePostLikedCount} from './firestore';
export {decreasePostLikedCount} from './firestore';

export {increaseCommentLikedCount} from './firestore';
export {decreaseCommentLikedCount} from './firestore';

export {sendToComment} from './fcm';
export {sendToPostLiked} from './fcm';
export {sendToCommentLiked} from './fcm';

export {resizeAvatar} from './storage';
// export {addPostId} from './firestore';
// export {createdUserRecord} from './firestore';
// export {resizeAvatar} from './storage';

