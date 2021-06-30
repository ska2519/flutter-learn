import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

admin.initializeApp();
const db = admin.firestore();

const increment = admin.firestore.FieldValue.increment(1);
const decrement = admin.firestore.FieldValue.increment(-1);

export const increaseUserCount = functions.firestore.document('users/{uid}').onCreate(async (snap, context) => {
    const countRef = db.doc('count/user');
    countRef.update({userCount: increment});
});

export const decreaseUserCount = functions.firestore.document('users/{uid}').onUpdate(async (change, context) => {
    const newValue = change.after.data();

    if (newValue.deletedUser == true) {
        const countRef = db.doc('count/user');
        countRef.update({userCount: decrement});
    }
});

export const increasePostCount = functions.firestore.document('posts/{postId}').onCreate(async (snap, context) => {
    const countRef = db.doc('count/post');
    countRef.update({postCount: increment});
});

export const decreasePostCount = functions.firestore.document('posts/{postId}').onDelete(async (snap, context) => {
    const countRef = db.doc('count/post');
    countRef.update({postCount: decrement});
});

export const increaseCommentCount = functions.firestore.document('posts/{postId}/comments/{commentId}').onCreate(async (snap, context) => {
    const batch = db.batch();

    const postId = snap.get('postId');
    const postRef = db.doc('posts/' + postId);
    batch.update(postRef, {commentCount: increment});

    const countRef = db.doc('count/comment');
    batch.update(countRef, {commentCount: increment});

    await batch.commit();
});

export const decreaseCommentCount = functions.firestore.document('posts/{postId}/comments/{commentId}').onDelete(async (snap, context) => {
    const batch = db.batch();

    const postId = snap.get('postId');
    const postRef = db.doc('posts/' + postId);
    batch.update(postRef, {commentCount: decrement});

    const countRef = db.doc('count/comment');
    batch.update(countRef, {commentCount: decrement});

    await batch.commit();
});

export const increaseReadUserCount = functions.firestore.document('posts/{postId}/readUsers/{userId}').onCreate(async (snap, context) => {
    const postId = snap.get('postId');
    const postRef = db.doc('posts/' + postId);
    postRef.update({readCount: increment});
});


