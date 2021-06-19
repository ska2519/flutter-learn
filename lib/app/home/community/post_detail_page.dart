import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/sign_in/sign_in_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pedantic/pedantic.dart';

import 'package:flutter_learn/app/home/community/edit_post_page.dart';
import 'package:flutter_learn/app/home/community/post_list_item.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
import 'package:flutter_learn/app/widgets/avatar.dart';
import 'package:flutter_learn/app/widgets/empty_content.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/models/comment.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';

import 'format.dart';
import 'post_list_item.dart';

final commentsStreamProvider =
    StreamProvider.autoDispose.family<List<Comment>, String>((ref, postId) {
  final database = ref.watch(databaseProvider);
  return database.commentsStream(postId);
});
final postStreamProvider =
    StreamProvider.autoDispose.family<Post, String>((ref, postId) {
  final database = ref.watch(databaseProvider);
  return database.postStream(postId);
});

class PostDetailPage extends StatefulHookWidget {
  const PostDetailPage({required this.postId});
  final String postId;

  static Future<void> show(BuildContext context,
      {required String postId}) async {
    await Navigator.of(context, rootNavigator: true).pushNamed(
      AppRoutes.postDetailPage,
      arguments: postId,
    );
  }

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  final formKey = GlobalKey<FormFieldState<String>>();
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;
  late String postId;
  Comment? editComment;
  String _commentText = '';

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
    postId = widget.postId;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _submitMockComments() async {
    final comments = List.generate(10, (_) => Comment.random(postId));
    await addCommentsBatch(comments);
  }

  Future<void> addCommentsBatch(List<Comment> comments) async {
    final database = context.read(databaseProvider);
    for (final comment in comments) {
      final reference = await database.setComment(comment);
      await database.updateComment(comment.copyWith(id: reference.id));
      final nowPost = await database.getPost(postId);
      if (nowPost != null) {
        await database.updatePost(
            nowPost.copyWith(commentCount: nowPost.commentCount + 1));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final commentsAsyncValue = useProvider(commentsStreamProvider(postId));
    final postAsyncValue = useProvider(postStreamProvider(postId));
    final database = useProvider(databaseProvider);
    final appUser = useProvider(appUserProvider);
    return postAsyncValue.when(
      loading: () => Center(child: const CupertinoActivityIndicator()),
      error: (_, __) => const EmptyContent(
        title: 'Something went wrong',
        message: "Can't load items right now",
      ),
      data: (post) => FutureBuilder(
        future: _addReadUsers(post),
        builder: (context, snapshot) => Scaffold(
          floatingActionButton: appUser.id == '7ytll7EosoUNI8Ix2hpPf8ZR3rH3'
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
            backgroundColor: Colors.transparent,
            elevation: 0,
            titleSpacing: 0,
            title: FutureBuilder<AppUser?>(
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
                      SizedBox(width: defaultPadding),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              postUser!.displayName!,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Text(
                              Format.duration(post.timestamp!),
                              style: Theme.of(context).textTheme.overline,
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return SizedBox();
              },
            ),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: flutterPrimaryColor,
                size: 20,
              ),
            ),
            actions: [
              // IconButton(
              //   padding: EdgeInsets.all(0),
              //   icon: Icon(
              //     Icons.notifications_off_outlined,
              //     color: flutterPrimaryColor,
              //     size: 20,
              //   ),
              //   onPressed: () {},
              // ),
              IconButton(
                padding: EdgeInsets.all(0),
                constraints: BoxConstraints.tight(Size(25, 17)),
                icon: Icon(
                  Icons.more_horiz,
                  color: post.userId == appUser.id
                      ? flutterPrimaryColor
                      : Colors.grey[400],
                  size: 20,
                ),
                onPressed: () => post.userId == appUser.id
                    ? showCupertinoModalPopup(
                        context: context,
                        builder: (context) => CupertinoActionSheet(
                          actions: [
                            CupertinoActionSheetAction(
                              onPressed: () async {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                await EditPostPage.show(context, post: post);
                              },
                              child: Text(LocaleKeys.edit.tr()),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () {
                                _deletePost(post);
                                Navigator.pop(context);
                              },
                              isDestructiveAction: true,
                              child: Text(LocaleKeys.delete.tr()),
                            )
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            onPressed: () => Navigator.pop(context),
                            child: Text(LocaleKeys.cancel.tr()),
                          ),
                        ),
                      )
                    : null,
              ),
              SizedBox(width: defaultPadding * 2),
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
                        child: PostListItem(post: post),
                      ),
                      Divider(),
                      commentsAsyncValue.when(
                        loading: () =>
                            Center(child: const CupertinoActivityIndicator()),
                        error: (_, __) => const EmptyContent(
                          title: 'Something went wrong',
                          message: "Can't load items right now",
                        ),
                        data: (comments) {
                          print('comments: ${comments.length}');
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: comments.length,
                            itemBuilder: (context, i) => Padding(
                              padding: const EdgeInsets.fromLTRB(
                                defaultPadding * 2,
                                defaultPadding,
                                defaultPadding,
                                0,
                              ),
                              child: FutureBuilder<AppUser?>(
                                future: database.getAppUser(comments[i].userId),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    late final commentUser = snapshot.data;
                                    return Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Avatar(
                                            photoUrl: commentUser?.photoURL,
                                            displayName:
                                                commentUser?.displayName,
                                            radius: 14,
                                          ),
                                        ),
                                        SizedBox(width: defaultPadding),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${commentUser!.displayName!} • ${Format.duration(comments[i].timestamp!)}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .overline!
                                                    .copyWith(
                                                        color: Colors.black54),
                                              ),
                                              SelectableText(
                                                comments[i].text,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .copyWith(
                                                        color: Colors.black87),
                                              ),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                          alignment: Alignment.topCenter,
                                          padding: EdgeInsets.all(0),
                                          onPressed: () => comments[i].userId ==
                                                  appUser.id
                                              ? commentHorizPopup(
                                                  context, comments[i], post)
                                              : null,
                                          icon: Icon(
                                            Icons.more_horiz,
                                            color:
                                                comments[i].userId == appUser.id
                                                    ? flutterPrimaryColor
                                                    : Colors.grey[400],
                                            size: 17,
                                          ),
                                        )
                                      ],
                                    );
                                  }
                                  return SizedBox();
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: _size.height * 0.1)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: appUser.id == null
                          ? () => SignInPage.show(context)
                          : null,
                      child: CupertinoTextField(
                        key: formKey,
                        // ignore: avoid_bool_literals_in_conditional_expressions
                        enabled: appUser.id == null ? false : true,

                        placeholder: LocaleKeys.pleaseWriteComment.tr(),
                        focusNode: _focusNode,
                        controller: _textEditingController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        maxLength: 500,
                        expands: true,
                        textInputAction: TextInputAction.newline,
                        onChanged: (commentText) => _commentText = commentText,
                        suffix: TextButton(
                          onPressed: () {
                            _submitComment(post: post);
                            _focusNode.unfocus();
                            _textEditingController.clear();
                          },
                          child: Text(LocaleKeys.post.tr()),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> commentHorizPopup(
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
            child: Text(LocaleKeys.edit.tr()),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              _deleteComment(comment, post);
              Navigator.pop(context);
            },
            isDestructiveAction: true,
            child: Text(LocaleKeys.delete.tr()),
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: Text(LocaleKeys.cancel.tr()),
        ),
      ),
    );
  }

  Comment _commentFromState(Post post, Comment? editComment) {
    final appUserAsyncValue = context.read(appUserStreamProvider);
    final appUser = appUserAsyncValue.data!.value!;
    final now = DateTime.now();
    return Comment(
      id: editComment?.id,
      postId: post.id,
      text: _commentText,
      userId: appUser.id!,
      timestamp: editComment != null ? editComment.timestamp : now,
    );
  }

  Future<void> _submitComment({required Post post}) async {
    try {
      final database = context.read(databaseProvider);
      final comment = _commentFromState(post, editComment);
      if (comment.text.isEmpty) {
        showPreventCommentSnackBar(context);
        return;
      }
      if (editComment == null) {
        final reference = await database.setComment(comment);
        await database.updateComment(comment.copyWith(id: reference.id));
        // Add commentCount
        final nowPost = await database.getPost(post.id);
        if (nowPost != null) {
          await database.updatePost(
              nowPost.copyWith(commentCount: nowPost.commentCount + 1));
        }
      } else {
        await database.updateComment(comment);
      }
    } catch (e) {
      unawaited(showExceptionAlertDialog(
        context: context,
        title: LocaleKeys.operationFailed.tr(),
        exception: e,
      ));
    }
  }

  Future _addReadUsers(Post post) async {
    final appUser = context.read(appUserProvider);
    if (appUser.id == null) {
      return;
    }

    if (!post.readUsers.contains(appUser.id)) {
      final readUsers = post.readUsers.toSet();
      readUsers.add(appUser.id!);
      final database = context.read(databaseProvider);
      database.updatePost(post.copyWith(readUsers: readUsers));
    }
  }

  void _deletePost(Post post) {
    try {
      final database = context.read(databaseProvider);
      database.deletePost(post.id);
      Navigator.pop(context);
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
    _focusNode.requestFocus();
    _textEditingController.selection = TextSelection.fromPosition(
        TextPosition(offset: _textEditingController.text.length));
  }

  void _deleteComment(Comment comment, Post post) {
    try {
      final database = context.read(databaseProvider);
      database.transactionDelComment(
        comment,
        post.copyWith(commentCount: post.commentCount - 1),
      );
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
}
