// import * as functions from 'firebase-functions';

// Start writing Firebase Functions
// https://firebase.google.com/docs/functions/typescript

// export const helloWorld = functions.https.onRequest((request, response) => {
//     functions.logger.info('Hello logs!', {structuredData: true});
//     response.send('Hello from Firebase!');
// });
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

export {resizeAvatar} from './storage';
// export {addPostId} from './firestore';
// export {createdUserRecord} from './firestore';
// export {resizeAvatar} from './storage';

