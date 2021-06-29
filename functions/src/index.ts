// import * as functions from 'firebase-functions';

// Start writing Firebase Functions
// https://firebase.google.com/docs/functions/typescript

// export const helloWorld = functions.https.onRequest((request, response) => {
//     functions.logger.info('Hello logs!', {structuredData: true});
//     response.send('Hello from Firebase!');
// });

export {increaseCommentCount} from './firestore';
export {decreaseCommentCount} from './firestore';
export {increaseReadUserCount} from './firestore';
// export {addPostId} from './firestore';

