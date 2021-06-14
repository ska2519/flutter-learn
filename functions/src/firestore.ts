import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
admin.initializeApp();
const db = admin.firestore();

export const commentCount = functions.firestore.document('posts/{postId}/comments/{commentId}').onCreate(async (snapshot, context) => {
    // const data = snapshot.data();

    const postRef = db.doc('posts/${postId}');

    const postSnap = await postRef.get();
    const postData = postSnap.data();

    return postRef.update({commentCount: postData?.commentCount + 1});
});
