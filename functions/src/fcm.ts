import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

const db = admin.firestore();
const fcm = admin.messaging();

export const sendToComment = functions.firestore.document('posts/{postId}/comments/{commentId}').onCreate(async (snap, context) => {
    const comment = snap.data();

    if (comment.postUserId == comment.userId) {
        return null;
    }

    if (comment.parentCmtUserId != null && comment.parentCmtUserId != comment.userId) {
        const querySnapshot = await db
            .collection('users')
            .doc(comment.parentCmtUserId)
            .collection('tokens')
            .get();
        const substrLength = 18 - comment.userDisplayName.length;
        const parentCmtText = comment.parentCmtText.substr(0, substrLength);
        const tokens = querySnapshot.docs.map((snap) => snap.id);

        const payload: admin.messaging.MessagingPayload = {
            notification: {
                title: comment.userDisplayName + '님이 "' + parentCmtText + '"에 대댓글을 달았습니다',
                body: comment.text,
                // icon: 'your-icon-url',
                click_action: 'FLUTTER_NOTIFICATION_CLICK',
            },
            data: {
                postId: comment.postId,
            },
        };
        fcm.sendToDevice(tokens, payload);
    }
    if (comment.postUserId == comment.parentCmtUserId) {
        return null;
    }

    const querySnapshot = await db
        .collection('users')
        .doc(comment.postUserId)
        .collection('tokens')
        .get();

    const tokens = querySnapshot.docs.map((snap) => snap.id);
    const substrLength = 19 - comment.userDisplayName.length;
    const postTitle = comment.postTitle.substr(0, substrLength);
    const payload: admin.messaging.MessagingPayload = {
        notification: {
            title: comment.userDisplayName + '님이 "' + postTitle + '"에 댓글을 달았습니다',
            body: comment.text,
            // icon: 'your-icon-url',
            click_action: 'FLUTTER_NOTIFICATION_CLICK',
        },
        data: {
            postId: comment.postId,
        },
    };
    return fcm.sendToDevice(tokens, payload);
});

export const sendToPostLiked = functions.firestore.document('posts/{postId}/postLiked/{likedUserId}').onCreate(async (snap, context) => {
    const postLiked = snap.data();

    if (postLiked.postUserId == postLiked.userId) {
        return null;
    }

    const ExistPostLiked = await db
        .collection('posts')
        .doc(postLiked.postId)
        .collection('postLiked').doc(postLiked.postUserId);

    if (ExistPostLiked != null) {
        return null;
    }


    const querySnapshot = await db
        .collection('users')
        .doc(postLiked.postUserId)
        .collection('tokens')
        .get();

    const tokens = querySnapshot.docs.map((snap) => snap.id);
    const substrLength = 19 - postLiked.userDisplayName.length;
    const postTitle = postLiked.postTitle.substr(0, substrLength);
    const payload: admin.messaging.MessagingPayload = {
        notification: {
            title: postLiked.userDisplayName + '님이 "' + postTitle + '" 게시물을 좋아합니다',
            // icon: 'your-icon-url',
            click_action: 'FLUTTER_NOTIFICATION_CLICK',
        },
        data: {
            postId: postLiked.postId,
        },
    };
    return fcm.sendToDevice(tokens, payload);
});

export const sendToCommentLiked = functions.firestore.document('posts/{postId}/comments/{commentId}/commentLiked/{likedUserId}').onCreate(async (snap, context) => {
    const commentLiked = snap.data();

    if (commentLiked.commentUserId == commentLiked.userId) {
        return null;
    }

    const querySnapshot = await db
        .collection('users')
        .doc(commentLiked.commentUserId)
        .collection('tokens')
        .get();

    const tokens = querySnapshot.docs.map((snap) => snap.id);
    const substrLength = 20 - commentLiked.userDisplayName.length;
    const commentText = commentLiked.commentText.substr(0, substrLength);
    const payload: admin.messaging.MessagingPayload = {
        notification: {
            title: commentLiked.userDisplayName + '님이 "' + commentText + '" 댓글을 좋아합니다',
            // icon: 'your-icon-url',
            click_action: 'FLUTTER_NOTIFICATION_CLICK',
        },
        data: {
            postId: commentLiked.postId,
        },
    };
    return fcm.sendToDevice(tokens, payload);
});
