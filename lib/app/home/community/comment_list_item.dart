// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import 'package:flutter_learn/app/widgets/avatar.dart';
// import 'package:flutter_learn/app/widgets/empty_content.dart';
// import 'package:flutter_learn/constants/constants.dart';
// import 'package:flutter_learn/models/app_user.dart';
// import 'package:flutter_learn/models/comment.dart';
// import 'package:flutter_learn/models/post.dart';
// import 'package:flutter_learn/services/firebase_auth_service.dart';
// import 'package:flutter_learn/services/firestore_database.dart';
// import 'package:flutter_learn/translations/locale_keys.g.dart';
// import 'package:pedantic/pedantic.dart';

// import 'format.dart';

// final commentsStreamProvider =
//     StreamProvider.autoDispose.family<List<Comment>, String>((ref, postId) {
//   final database = ref.watch(databaseProvider);
//   return database.commentsStream(postId);
// });

// final childCommentsStreamProvider =
//     StreamProvider.autoDispose.family<List<Comment>, String>((ref, postId) {
//   final database = ref.watch(databaseProvider);
//   return database.childCommentsStream(postId);
// });

// class CommentListItem extends HookWidget {
//   const CommentListItem(this.post, {Key? key}) : super(key: key);
//   final Post post;

//   @override
//   Widget build(BuildContext context) {
//     final database = useProvider(databaseProvider);
//     final appUser = useProvider(appUserProvider);
//     final commentsAsyncValue = useProvider(commentsStreamProvider(post.id!));
//     final childCommentsAsyncValue =
//         useProvider(childCommentsStreamProvider(post.id!));
//     return commentsAsyncValue.when(
//       loading: () => Center(child: const CupertinoActivityIndicator()),
//       error: (_, __) => const EmptyContent(
//         title: 'Something went wrong',
//         message: "Can't load items right now",
//       ),
//       data: (comments) {
//         print('comments: $comments');
//         return ListView.builder(
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: comments.length,
//           itemBuilder: (context, i) => Padding(
//             padding: const EdgeInsets.fromLTRB(
//               defaultPadding * 2,
//               defaultPadding,
//               defaultPadding,
//               0,
//             ),
//             child: FutureBuilder<AppUser?>(
//               future: database.getAppUser(comments[i].userId),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   late final commentUser = snapshot.data;
//                   return Column(
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                               width: comments[i].level! * defaultPadding * 2),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 5),
//                             child: Avatar(
//                               photoUrl: commentUser?.photoURL,
//                               displayName: commentUser?.displayName,
//                               radius: 14,
//                             ),
//                           ),
//                           const SizedBox(width: defaultPadding),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   '${commentUser!.displayName!} • ${Format.duration(comments[i].timestamp!)}',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .overline!
//                                       .copyWith(color: Colors.black54),
//                                 ),
//                                 SelectableText(
//                                   comments[i].text,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .caption!
//                                       .copyWith(color: Colors.black87),
//                                 ),
//                                 Row(
//                                   children: [
//                                     InkWell(
//                                       highlightColor: Colors.transparent,
//                                       splashColor: Colors.transparent,
//                                       onTap: () =>
//                                           comments[i].userId == appUser.id
//                                               ? commentHorizPopup(
//                                                   context, comments[i], post)
//                                               : null,
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(
//                                             defaultPadding),
//                                         child: Icon(
//                                           Icons.more_horiz,
//                                           color:
//                                               comments[i].userId == appUser.id
//                                                   ? flutterPrimaryColor
//                                                   : Colors.grey[400],
//                                           size: 17,
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(width: defaultPadding),
//                                     InkWell(
//                                       highlightColor: Colors.transparent,
//                                       splashColor: Colors.transparent,
//                                       onTap: () => _replyComment(comments[i]),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(
//                                             defaultPadding),
//                                         child: Icon(
//                                           Icons.reply,
//                                           color: flutterPrimaryColor,
//                                           size: 17,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                           InkWell(
//                             highlightColor: Colors.transparent,
//                             splashColor: Colors.transparent,
//                             child: Padding(
//                               padding: const EdgeInsets.all(defaultPadding),
//                               child: Icon(
//                                 Icons.favorite_border,
//                                 color: Colors.grey,
//                                 size: 15,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       childCommentsAsyncValue.when(
//                           loading: () =>
//                               Center(child: const CupertinoActivityIndicator()),
//                           error: (_, __) => const EmptyContent(
//                                 title: 'Something went wrong',
//                                 message: "Can't load items right now",
//                               ),
//                           data: (childComments) {
//                             print('childComments: $childComments');
//                             return ListView.builder(
//                               physics: const NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               itemCount: childComments.length,
//                               itemBuilder: (context, i) {
//                                 return Text(childComments[i].text);
//                               },
//                             );
//                           }),
//                     ],
//                   );
//                 }
//                 return const SizedBox();
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _replyComment(Comment comment) {
//     _focusNode.requestFocus();
//     parentComment = comment;
//   }

//   void _editComment(Comment comment) {
//     _textEditingController.text = comment.text;
//     editComment = comment;
//     _focusNode.requestFocus();
//     _textEditingController.selection = TextSelection.fromPosition(
//         TextPosition(offset: _textEditingController.text.length));
//   }

//   void _deleteComment(BuildContext context, Comment comment, Post post) {
//     try {
//       final database = context.read(databaseProvider);
//       database.transactionDelComment(
//         comment,
//         post.copyWith(commentCount: post.commentCount - 1),
//       );
//     } catch (e) {
//       unawaited(showExceptionAlertDialog(
//         context: context,
//         title: LocaleKeys.operationFailed.tr(),
//         exception: e,
//       ));
//     }
//   }

//   Future<dynamic> commentHorizPopup(
//       BuildContext context, Comment comment, Post post) {
//     return showCupertinoModalPopup(
//       context: context,
//       builder: (context) => CupertinoActionSheet(
//         actions: [
//           CupertinoActionSheetAction(
//             onPressed: () {
//               Navigator.pop(context);
//               _editComment(comment);
//             },
//             child: Text(LocaleKeys.edit.tr()),
//           ),
//           CupertinoActionSheetAction(
//             onPressed: () {
//               _deleteComment(context, comment, post);
//               Navigator.pop(context);
//             },
//             isDestructiveAction: true,
//             child: Text(LocaleKeys.delete.tr()),
//           )
//         ],
//         cancelButton: CupertinoActionSheetAction(
//           onPressed: () => Navigator.pop(context),
//           child: Text(LocaleKeys.cancel.tr()),
//         ),
//       ),
//     );
//   }
// }
