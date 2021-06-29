// import * as functions from 'firebase-functions';
// import * as admin from 'firebase-admin';
// admin.initializeApp();

// const db = admin.firestore();

// export const createdUserRecord = functions.auth.user().onCreate((user, context) => {
//     const userRef = db.doc('users/${user.uid}');

//     return userRef.set({
//         name: user.displayName,
//         createdAt: context.timestamp,
//         nickName: 'bubba',
//     });
// });
