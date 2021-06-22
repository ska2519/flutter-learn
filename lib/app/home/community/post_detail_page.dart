import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pedantic/pedantic.dart';

import 'package:flutter_learn/app/home/community/child_comment_list_item.dart';
import 'package:flutter_learn/app/home/community/edit_post_page.dart';
import 'package:flutter_learn/app/home/community/post_list_item.dart';
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
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';

import 'format.dart';
import 'post_list_item.dart';

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
final commentFieldKeyProvider =
    StateProvider<GlobalKey<State<StatefulWidget>>?>((ref) => null);

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

  // void createStateCommentField({required bool autofocus}) =>
  //     createState().commentField(autofocus: autofocus);

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  static final GlobalKey _commentFieldKey = GlobalKey();
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  late String postId;
  Comment? editComment, parentComment;
  String _commentText = '';
  bool autoFocus = false;
  @override
  void initState() {
    super.initState();
    postId = widget.postId!;
    if (widget.autoFocus != null) autoFocus = widget.autoFocus!;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
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
      final reference = await database.addComment(comment);
      await database.updateComment(comment.copyWith(id: reference.id));
      _addCommentCount();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final commentsAsyncValue =
        useProvider(topLevelCommentsStreamProvider(postId));
    final postAsyncValue = useProvider(postStreamProvider(postId));
    final database = useProvider(databaseProvider);
    final appUser = useProvider(appUserProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: postAsyncValue.when(
        loading: () => Center(child: const CupertinoActivityIndicator()),
        error: (_, __) => const EmptyContent(
          title: 'Something went wrong',
          message: "Can't load items right now",
        ),
        data: (post) => FutureBuilder(
          future: _addReadUsers(),
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
                                Format.duration(post.timestamp!),
                                style: Theme.of(context).textTheme.overline,
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return const SizedBox();
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
                            print('comments: $comments');
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
                                  future:
                                      database.getAppUser(comments[i].userId),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      late final commentUser = snapshot.data;
                                      return Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                  width: comments[i].level! *
                                                      defaultPadding *
                                                      2),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Avatar(
                                                  photoUrl:
                                                      commentUser?.photoURL,
                                                  displayName:
                                                      commentUser?.displayName,
                                                  radius: 14,
                                                ),
                                              ),
                                              const SizedBox(
                                                  width: defaultPadding),
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
                                                              color: Colors
                                                                  .black54),
                                                    ),
                                                    SelectableText(
                                                      comments[i].text,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption!
                                                          .copyWith(
                                                              color: Colors
                                                                  .black87),
                                                    ),
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                          highlightColor: Colors
                                                              .transparent,
                                                          splashColor: Colors
                                                              .transparent,
                                                          onTap: () => comments[
                                                                          i]
                                                                      .userId ==
                                                                  appUser.id
                                                              ? commentHorizPopup(
                                                                  context,
                                                                  comments[i],
                                                                  post)
                                                              : null,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .all(
                                                                    defaultPadding),
                                                            child: Icon(
                                                              Icons.more_horiz,
                                                              color: comments[i]
                                                                          .userId ==
                                                                      appUser.id
                                                                  ? flutterPrimaryColor
                                                                  : Colors.grey[
                                                                      400],
                                                              size: 17,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width:
                                                                defaultPadding),
                                                        InkWell(
                                                          highlightColor: Colors
                                                              .transparent,
                                                          splashColor: Colors
                                                              .transparent,
                                                          onTap: () =>
                                                              _replyComment(
                                                                  comments[i]),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .all(
                                                                    defaultPadding),
                                                            child: Icon(
                                                              Icons.reply,
                                                              color:
                                                                  flutterPrimaryColor,
                                                              size: 17,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                highlightColor:
                                                    Colors.transparent,
                                                splashColor: Colors.transparent,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      defaultPadding),
                                                  child: Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.grey,
                                                    size: 15,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          ChildCommentListItem(comments[i])
                                        ],
                                      );
                                    }
                                    return const SizedBox();
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
                          key: _commentFieldKey,
                          autofocus: autoFocus,
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
                          onChanged: (commentText) =>
                              _commentText = commentText,
                          suffix: TextButton(
                            onPressed: () {
                              _submitComment();
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

  Comment _commentFromState(
      String postId, Comment? editComment, Comment? parentComment) {
    final appUserAsyncValue = context.read(appUserStreamProvider);
    final appUser = appUserAsyncValue.data!.value!;
    final now = DateTime.now();
    return Comment(
      id: editComment?.id,
      postId: postId,
      text: _commentText,
      userId: appUser.id!,
      timestamp: editComment != null ? editComment.timestamp : now,
      level: parentComment != null ? parentComment.level! + 1 : 0,
      parent: parentComment != null
          ? '${parentComment.parent!}${parentComment.id!}'
          : '',
    );
  }

  void _replyComment(Comment comment) {
    _focusNode.requestFocus();
    parentComment = comment;
  }

  Future<void> _submitComment() async {
    try {
      final database = context.read(databaseProvider);
      final comment = _commentFromState(postId, editComment, parentComment);
      if (comment.text.isEmpty) {
        showPreventCommentSnackBar(context);
        return;
      }
      if (editComment == null) {
        final reference = await database.addComment(comment);
        await database.updateComment(comment.copyWith(id: reference.id));
        await _addCommentCount();
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

  Future<void> _addCommentCount() async {
    try {
      final database = context.read(databaseProvider);
      final nowPost = await database.getPost(postId);
      if (nowPost != null) {
        await database.updatePost(
            nowPost.copyWith(commentCount: nowPost.commentCount + 1));
      }
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
      final appUser = context.read(appUserProvider);
      final database = context.read(databaseProvider);
      if (appUser.id == null) {
        return;
      }
      final readUsers = await database.getPostReadUsers(postId);
      if (readUsers != null && !readUsers.contains(appUser.id)) {
        database.setReadUser(
          ReadPost(
            postId: postId,
            userId: appUser.id!,
            timestamp: DateTime.now(),
          ),
        );
        await _addReadCount();
      }
    } catch (e) {
      unawaited(showExceptionAlertDialog(
        context: context,
        title: LocaleKeys.operationFailed.tr(),
        exception: e,
      ));
    }
  }

  Future<void> _addReadCount() async {
    try {
      final database = context.read(databaseProvider);
      final nowPost = await database.getPost(postId);
      if (nowPost != null) {
        await database
            .updatePost(nowPost.copyWith(readCount: nowPost.readCount + 1));
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
    try {
      final database = context.read(databaseProvider);
      database.deletePost(post.id!);
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
