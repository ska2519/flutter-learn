import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
admin.initializeApp();
const db = admin.firestore();

// const postSnap = await postRef.get();
// const postData = postSnap.data();
// await postRef.update({commentCount: postData?.commentCount + 1});

export const increaseCommentCount = functions.firestore.document('posts/{postId}/comments/{commentId}').onCreate(async (snap, __) => {
    const postId = snap.get('postId');
    const postRef = db.doc('posts/' + postId);
    try {
        await postRef.update({commentCount: admin.firestore.FieldValue.increment(1)});
    } catch (error) {
        console.log('failed increaseCommentCount');
    }
});

export const decreaseCommentCount = functions.firestore.document('posts/{postId}/comments/{commentId}').onDelete(async (snap, __) => {
    const postId = snap.get('postId');
    const postRef = db.doc('posts/' + postId);
    try {
        await postRef.update({commentCount: admin.firestore.FieldValue.increment(-1)});
    } catch (error) {
        console.log('failed decreaseCommentCount');
    }
});

export const increaseReadUserCount = functions.firestore.document('posts/{postId}/readUsers/{userId}').onCreate(async (snap, __) => {
    const postId = snap.get('postId');
    const postRef = db.doc('posts/' + postId);
    try {
        await postRef.update({readCount: admin.firestore.FieldValue.increment(1)});
    } catch (error) {
        console.log('failed increaseReadUserCount');
    }
});

// export const addPostId = functions.firestore
//     .document('posts/{postId}')
//     .onCreate(async (snap, _) => await snap.ref.update({id: snap.id}));

