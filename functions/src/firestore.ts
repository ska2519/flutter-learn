import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
admin.initializeApp();
// const db = admin.firestore();

// 딜레이 걸려서 많은 데이터 입력 시 모두 안들어감 - 사용 불가
// export const increaseCommentCount = functions.firestore.document('posts/{postId}/comments/{commentId}').onCreate(async (snap, __) => {
//     const postId = snap.get('postId');
//     const postRef = db.doc('posts/' + postId);
//     const postSnap = await postRef.get();
//     const postData = postSnap.data();
//     return await postRef.update({commentCount: postData?.commentCount + 1});
// });

// export const decreaseCommentCount = functions.firestore.document('posts/{postId}/comments/{commentId}').onDelete(async (snap, __) => {
//     const postId = snap.get('postId');
//     const postRef = db.doc('posts/' + postId);
//     const postSnap = await postRef.get();
//     const postData = postSnap.data();
//     return await postRef.update({commentCount: postData?.commentCount - 1});
// });

export const addPostId = functions.firestore
    .document('posts/{postId}')
    .onCreate(async (snap, _) => await snap.ref.update({id: snap.id}));

