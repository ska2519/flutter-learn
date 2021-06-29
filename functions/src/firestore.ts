import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

admin.initializeApp();
const db = admin.firestore();

// const postSnap = await postRef.get();
// const postData = postSnap.data();
// await postRef.update({commentCount: postData?.commentCount + 1});
// export const createdUserRecord = functions.auth.user().onCreate((user, context) => {
//     // const userRef = db.doc('users/' + user.uid);
//     const userRef = db.doc('users/${user.uid}');

//     return userRef.set({
//         name: user.displayName,
//         createdAt: context.timestamp,
//         nickName: 'bubba',
//     });
// });

export const increaseUserCount = functions.firestore.document('users/{uid}').onCreate(async (snap, context) => {
    const countRef = db.doc('count/user');
    try {
        await countRef.update({userCount: admin.firestore.FieldValue.increment(1)});
    } catch (error) {
        console.log('failed increaseUserCount');
    }
});

export const decreaseUserCount = functions.firestore.document('users/{uid}').onDelete(async (snap, context) => {
    const countRef = db.doc('count/user');
    try {
        await countRef.update({userCount: admin.firestore.FieldValue.increment(-1)});
    } catch (error) {
        console.log('failed decreaseUserCount');
    }
});

export const increaseCommentCount = functions.firestore.document('posts/{postId}/comments/{commentId}').onCreate(async (snap, context) => {
    const postId = snap.get('postId');
    const postRef = db.doc('posts/' + postId);
    const countRef = db.doc('count/comment');
    try {
        await postRef.update({commentCount: admin.firestore.FieldValue.increment(1)});
        await countRef.update({commentCount: admin.firestore.FieldValue.increment(1)});
    } catch (error) {
        console.log('failed increaseCommentCount');
    }
});

export const decreaseCommentCount = functions.firestore.document('posts/{postId}/comments/{commentId}').onDelete(async (snap, context) => {
    const postId = snap.get('postId');
    const postRef = db.doc('posts/' + postId);
    const countRef = db.doc('count/comment');
    try {
        await postRef.update({commentCount: admin.firestore.FieldValue.increment(-1)});
        await countRef.update({commentCount: admin.firestore.FieldValue.increment(-1)});
    } catch (error) {
        console.log('failed decreaseCommentCount');
    }
});

export const increaseReadUserCount = functions.firestore.document('posts/{postId}/readUsers/{userId}').onCreate(async (snap, context) => {
    const postId = snap.get('postId');
    const postRef = db.doc('posts/' + postId);
    try {
        await postRef.update({readCount: admin.firestore.FieldValue.increment(1)});
    } catch (error) {
        console.log('failed increaseReadUserCount');
    }
});

export const increasePostCount = functions.firestore.document('posts/{postId}').onCreate(async (snap, context) => {
    const countRef = db.doc('count/post');
    try {
        await countRef.update({postCount: admin.firestore.FieldValue.increment(1)});
    } catch (error) {
        console.log('failed increasePostCount');
    }
});

export const decreasePosCount = functions.firestore.document('posts/{postId}').onDelete(async (snap, context) => {
    const countRef = db.doc('count/post');
    try {
        await countRef.update({postCount: admin.firestore.FieldValue.increment(-1)});
    } catch (error) {
        console.log('failed decreaseCommentCount');
    }
});
// export const addPostId = functions.firestore
//     .document('posts/{postId}')
//     .onCreate(async (snap, _) => await snap.ref.update({id: snap.id}));

