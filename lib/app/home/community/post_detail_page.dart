import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pedantic/pedantic.dart';

import 'package:flutter_learn/app/home/community/child_comment_list_item.dart';
import 'package:flutter_learn/app/home/community/edit_post_page.dart';
import 'package:flutter_learn/app/home/community/post_item_info.dart';
import 'package:flutter_learn/app/sign_in/sign_in_page.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
import 'package:flutter_learn/app/widgets/avatar.dart';
import 'package:flutter_learn/app/widgets/empty_content.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/models/comment.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/models/read_post.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/secret_keys.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';
import 'package:flutter_learn/utils/format.dart';

import 'comment_list_item.dart';
import 'post_item_info.dart';

final topLevelCommentsStreamProvider =
    StreamProvider.autoDispose.family<List<Comment>, String>((ref, postId) {
  final database = ref.read(databaseProvider);
  return database.topLevelCommentsStream(postId);
});

final postStreamProvider =
    StreamProvider.autoDispose.family<Post, String>((ref, postId) {
  final database = ref.read(databaseProvider);
  return database.postStream(postId);
});

class PostDetailPage extends StatefulHookWidget {
  const PostDetailPage({this.postId, this.autoFocus = false, Key? key})
      : super(key: key);
  final String? postId;
  final bool? autoFocus;

  static Future<void> show(BuildContext context,
      {required String postId, bool? autoFocus, Key? key}) async {
    await Navigator.of(context, rootNavigator: true).pushNamed(
      AppRoutes.postDetailPage,
      arguments: {'postId': postId, 'autoFocus': autoFocus, 'key': key},
    );
  }

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  late TextEditingController _textEditingController;
  late FocusNode focusNode;
  late String postId;
  Comment? editComment, parentComment;
  bool autoFocus = false;
  late Future _checkReadUsers;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    focusNode = FocusNode();
    focusNode.addListener(() {});
    postId = widget.postId!;
    if (widget.autoFocus != null) autoFocus = widget.autoFocus!;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _checkReadUsers = _addReadUsers();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  Future<void> _submitMockComments() async {
    final comments = List.generate(10, (_) => Comment.random(postId));
    await setCommentsBatch(comments);
  }

  Future<void> setCommentsBatch(List<Comment> comments) async {
    final database = context.read(databaseProvider);
    for (final comment in comments) {
      await database.setComment(comment);
    }
  }

  Future<void> editOrDeleteCommentPopup(
      BuildContext context, Comment comment, Post post) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              _editComment(comment);
            },
            child: Text(
              comment.private
                  ? LocaleKeys.changeToPublic.tr()
                  : LocaleKeys.edit.tr(),
            ),
          ),
          if (comment.private && comment.childCount > 0)
            const SizedBox()
          else
            CupertinoActionSheetAction(
              onPressed: () {
                _deleteComment(comment, post);
                Navigator.pop(context);
              },
              isDestructiveAction: true,
              child: Text(
                comment.childCount > 0
                    ? LocaleKeys.privateComment.tr()
                    : LocaleKeys.delete.tr(),
              ),
            )
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: Text(LocaleKeys.cancel.tr()),
        ),
      ),
    );
  }

  Comment _commentFromState() {
    final appUser = context.read(appUserStreamProvider).data?.value;
    final now = DateTime.now();
    final currentDate = documentIdFromCurrentDate().substring(0, 19);
    final commentId = editComment?.id ?? '$currentDate:${appUser!.id}';
    print('parentComment: $parentComment');
    return Comment(
      id: commentId,
      postId: postId,
      text: _textEditingController.text,
      userId: appUser!.id!,
      timestamp: editComment != null ? editComment!.timestamp : now,
      childCount: editComment?.childCount ?? 0,
      likedUsers: editComment?.likedUsers ?? {},
      level: editComment != null
          ? editComment!.level
          : parentComment != null
              ? parentComment!.level + 1
              : 0,
      parent: editComment != null
          ? editComment?.parent
          : parentComment != null
              ? parentComment!.id
              : null,
    );
  }

  void _replyComment(Comment comment) {
    focusNode.requestFocus();
    parentComment = comment;
  }

  void _submitComment() {
    try {
      final database = context.read(databaseProvider);
      final comment = _commentFromState();
      if (comment.text.isEmpty) {
        showPreventCommentSnackBar(context);
        return;
      }
      if (editComment == null) {
        database.setComment(comment);
      } else {
        database.updateComment(comment);
      }
      editComment = null;
      parentComment = null;
    } catch (e) {
      unawaited(showExceptionAlertDialog(
        context: context,
        title: LocaleKeys.operationFailed.tr(),
        exception: e,
      ));
    }
  }

  Future<void> _addReadUsers() async {
    try {
      final appUser = context.read(appUserStreamProvider).data?.value;
      final database = context.read(databaseProvider);
      if (appUser == null) {
        return;
      }
      final readUsers = await database.getPostReadUsers(postId);
      if (!readUsers.contains(appUser.id)) {
        database.setReadUser(
          ReadPost(
            postId: postId,
            userId: appUser.id!,
            timestamp: DateTime.now(),
          ),
        );
      }
    } catch (e) {
      unawaited(showExceptionAlertDialog(
        context: context,
        title: LocaleKeys.operationFailed.tr(),
        exception: e,
      ));
    }
  }

  void _deletePost(Post post) {
    final database = context.read(databaseProvider);
    try {
      if (post.commentCount > 0) {
        database.updatePost(post.copyWith(private: true));
      } else {
        database.deletePost(post.id);
        Navigator.pop(context);
      }
    } catch (e) {
      unawaited(showExceptionAlertDialog(
        context: context,
        title: LocaleKeys.operationFailed.tr(),
        exception: e,
      ));
    }
  }

  void _editComment(Comment comment) {
    _textEditingController.text = comment.text;
    editComment = comment;
    focusNode.requestFocus();
    _textEditingController.selection = TextSelection.fromPosition(
        TextPosition(offset: _textEditingController.text.length));
  }

  void _deleteComment(Comment comment, Post post) {
    try {
      final database = context.read(databaseProvider);
      if (comment.childCount > 0) {
        database.updateComment(comment.copyWith(private: true));
      } else {
        database.deleteComment(comment);
      }
    } catch (e) {
      unawaited(showExceptionAlertDialog(
        context: context,
        title: LocaleKeys.operationFailed.tr(),
        exception: e,
      ));
    }
  }

  void showPreventCommentSnackBar(BuildContext context) =>
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(SnackBar(
          content: Text(LocaleKeys.pleaseWriteComment.tr()),
          duration: Duration(milliseconds: 300),
        ));

  @override
  Widget build(BuildContext context) {
    if (!focusNode.hasFocus) parentComment = null;
    final _size = MediaQuery.of(context).size;
    final commentsAsyncValue =
        useProvider(topLevelCommentsStreamProvider(postId));
    final postAsyncValue = useProvider(postStreamProvider(postId));
    final appUser = useProvider(appUserStreamProvider).data?.value;
    print('PostDetailPage build');
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: postAsyncValue.when(
        loading: () => Center(child: const CupertinoActivityIndicator()),
        error: (_, __) => EmptyContent(
          title: LocaleKeys.somethingWentWrong.tr(),
          message: LocaleKeys.cantLoadDataRightNow.tr(),
        ),
        data: (post) => FutureBuilder(
          future: _checkReadUsers,
          builder: (context, snapshot) => Scaffold(
            floatingActionButton: appUser?.id == debugAdminUid ||
                    appUser?.id == releaseAdminUid
                ? Padding(
                    padding: const EdgeInsets.only(bottom: defaultPadding * 6),
                    child: FloatingActionButton(
                      mini: true,
                      onPressed: _submitMockComments,
                      child: Text(
                        LocaleKeys.test.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  )
                : null,
            appBar: AppBar(
              elevation: 0,
              titleSpacing: 0,
              title: PostDetailAppBarTitle(post: post),
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios_new, size: 20),
              ),
              actions: [
                // IconButton(
                //   padding: EdgeInsets.all(0),
                //   icon: Icon(
                //     Icons.notifications_off_outlined,
                //     color: flutterPrimaryColor,
                //   ),
                //   onPressed: () {},
                // ),
                if (post.userId == appUser?.id)
                  IconButton(
                    padding: EdgeInsets.all(0),
                    constraints: BoxConstraints.tight(Size(25, 17)),
                    icon: Icon(Icons.more_horiz),
                    onPressed: () => editOrDeletePostPopup(context, post),
                  )
                else
                  const SizedBox(),
                const SizedBox(width: defaultPadding * 2),
              ],
            ),
            body: SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding * 2),
                          child: PostItemInfo(
                            post: post,
                            selectableText: true,
                          ),
                        ),
                        Divider(),
                        commentsAsyncValue.when(
                          loading: () =>
                              Center(child: const CupertinoActivityIndicator()),
                          error: (_, __) => EmptyContent(
                            title: LocaleKeys.somethingWentWrong.tr(),
                            message: LocaleKeys.cantLoadDataRightNow.tr(),
                          ),
                          data: (comments) {
                            return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: comments.length,
                                itemBuilder: (context, i) {
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      defaultPadding * 2,
                                      defaultPadding,
                                      defaultPadding,
                                      0,
                                    ),
                                    child: Column(
                                      children: [
                                        CommentListItem(
                                          comment: comments[i],
                                          menuIconTap: () =>
                                              editOrDeleteCommentPopup(
                                                  context, comments[i], post),
                                          replyIconTap: () =>
                                              _replyComment(comments[i]),
                                        ),
                                        ChildCommentListItem(
                                          topLevelComment: comments[i],
                                          menuIconTap: (Comment childComment) =>
                                              editOrDeleteCommentPopup(
                                                  context, childComment, post),
                                          replyIconTap:
                                              (Comment childComment) =>
                                                  _replyComment(childComment),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                        ),
                        SizedBox(height: _size.height * 0.1),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (parentComment != null)
                          ReplyParentComment(parentComment: parentComment)
                        else
                          const SizedBox(),
                        InkWell(
                          onTap: appUser == null
                              ? () => SignInPage.show(context)
                              : null,
                          child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.all(defaultPadding),
                            child: CupertinoTextField(
                              autofocus: autoFocus,
                              // ignore: avoid_bool_literals_in_conditional_expressions
                              enabled: appUser == null ? false : true,
                              placeholder: LocaleKeys.pleaseWriteComment.tr(),
                              focusNode: focusNode,
                              controller: _textEditingController,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              maxLength: 500,
                              expands: true,
                              textInputAction: TextInputAction.newline,
                              suffix: TextButton(
                                onPressed: () {
                                  _submitComment();
                                  focusNode.unfocus();
                                  _textEditingController.clear();
                                },
                                child: Text(LocaleKeys.post.tr()),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> editOrDeletePostPopup(BuildContext context, Post post) =>
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () async {
                Navigator.pop(context);
                Navigator.pop(context);
                await EditPostPage.show(context, post: post);
              },
              child: Text(
                post.private
                    ? LocaleKeys.changeToPublic.tr()
                    : LocaleKeys.edit.tr(),
              ),
            ),
            if (post.private)
              const SizedBox()
            else
              CupertinoActionSheetAction(
                onPressed: () {
                  _deletePost(post);
                  Navigator.pop(context);
                },
                isDestructiveAction: true,
                child: Text(
                  post.commentCount > 0
                      ? LocaleKeys.privatePost.tr()
                      : LocaleKeys.delete.tr(),
                ),
              )
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: Text(LocaleKeys.cancel.tr()),
          ),
        ),
      );
}

class ReplyParentComment extends StatelessWidget {
  const ReplyParentComment({
    Key? key,
    required this.parentComment,
  }) : super(key: key);

  final Comment? parentComment;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: flutterPrimaryColor,
          width: 2,
        ),
        color: flutterAccentColor,
      ),
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        children: [
          Icon(
            Icons.reply,
            color: Colors.white,
            size: 17,
          ),
          const SizedBox(width: defaultPadding),
          Expanded(
            child: Text(
              parentComment!.text,
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class PostDetailAppBarTitle extends StatelessWidget {
  const PostDetailAppBarTitle({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    final database = context.read(databaseProvider);
    return FutureBuilder<AppUser?>(
      future: database.getAppUser(post.userId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final postUser = snapshot.data;
          return Row(
            children: [
              Avatar(
                photoUrl: postUser?.photoURL,
                displayName: postUser?.displayName,
                radius: 19,
              ),
              const SizedBox(width: defaultPadding),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      postUser!.displayName!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      duration(post.timestamp!),
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
