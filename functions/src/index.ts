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

export {customTokenFromKakao} from './kakao';
export {customTokenFromNaver} from './naver';

// export {addPostId} from './firestore';
// export {createdUserRecord} from './firestore';
// export {resizeAvatar} from './storage';

