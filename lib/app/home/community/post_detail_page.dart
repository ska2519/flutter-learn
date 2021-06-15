import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/home/community/edit_post_page.dart';
import 'package:flutter_learn/app/home/community/post_list_item.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
import 'package:flutter_learn/app/widgets/avatar.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/models/comment.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pedantic/pedantic.dart';

import 'format.dart';

final commentsStreamProvider =
    StreamProvider.autoDispose.family<List<Comment>, Post>((ref, post) {
  final database = ref.watch(databaseProvider);
  return database.commentsStream(post);
});

class PostDetailPage extends StatefulHookWidget {
  const PostDetailPage({required this.post, Key? key}) : super(key: key);
  final Post post;

  static Future<void> show(BuildContext context, {required Post post}) async {
    await Navigator.of(context, rootNavigator: true).pushNamed(
      AppRoutes.postDetailPage,
      arguments: post,
    );
  }

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  final formKey = GlobalKey<FormFieldState<String>>();
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;
  late Post post;
  Comment? editComment;
  String _commentText = '';

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
    post = widget.post;
    _addReadUsers(post);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _submitMockComments() async {
    final comments = List.generate(10, (_) => Comment.random(post.id));
    await addCommentsBatch(comments);
  }

  Future<void> addCommentsBatch(List<Comment> comments) async {
    final database = context.read(databaseProvider);
    for (final comment in comments) {
      final reference = await database.setComment(comment);
      await database.updateComment(comment.copyWith(id: reference.id));
      final nowPost = await database.getPost(post.id);
      if (nowPost != null) {
        await database.updatePost(
            nowPost.copyWith(commentCount: nowPost.commentCount + 1));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final commentsStream = useProvider(commentsStreamProvider(widget.post));
    final database = useProvider(databaseProvider);
    final appUser = useProvider(appUserProvider);
    return Scaffold(
      floatingActionButton: appUser.id == '7ytll7EosoUNI8Ix2hpPf8ZR3rH3'
          ? Padding(
              padding: const EdgeInsets.only(bottom: defaultPadding * 6),
              child: FloatingActionButton(
                mini: true,
                onPressed: _submitMockComments,
                child: Text(
                  'Test',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
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
          IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(
              Icons.notifications_off_outlined,
              color: flutterPrimaryColor,
              size: 20,
            ),
            onPressed: () {},
          ),
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
                          child: Text('수정'),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () {
                            _deletePost(post);
                            Navigator.pop(context);
                          },
                          isDestructiveAction: true,
                          child: Text('삭제'),
                        )
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        onPressed: () => Navigator.pop(context),
                        child: Text('취소'),
                      ),
                    ),
                  )
                : null,
          ),
          SizedBox(width: defaultPadding * 2),
        ],
      ),
      body: SafeArea(
        child: commentsStream.when(
          loading: () => Center(child: const CupertinoActivityIndicator()),
          error: (error, stack) => const Text('Oops'),
          data: (comments) => Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    PostListItem(
                      post: widget.post,
                      postUserInfo: false,
                    ),
                    Divider(),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: comments.length,
                      itemBuilder: (context, i) => Padding(
                        padding: const EdgeInsets.fromLTRB(
                          defaultPadding * 2,
                          defaultPadding,
                          defaultPadding,
                          defaultPadding,
                        ),
                        child: FutureBuilder<AppUser?>(
                          future: database.getAppUser(comments[i].userId),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              late final commentUser = snapshot.data;
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Avatar(
                                    photoUrl: commentUser?.photoURL,
                                    displayName: commentUser?.displayName,
                                    radius: 16,
                                  ),
                                  SizedBox(width: defaultPadding),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          commentUser!.displayName!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        SelectableText(
                                          comments[i].text,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    alignment: Alignment.topCenter,
                                    padding: EdgeInsets.all(0),
                                    onPressed: () =>
                                        comments[i].userId == appUser.id
                                            ? commentHorizPopup(
                                                context, comments[i])
                                            : null,
                                    icon: Icon(
                                      Icons.more_horiz,
                                      color: comments[i].userId == appUser.id
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
                    ),
                    SizedBox(height: size.height * 0.1)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CupertinoTextField(
                    key: formKey,
                    placeholder: 'Write a Comment',
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
                      child: Text('POST'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> commentHorizPopup(BuildContext context, Comment comment) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              _editComment(comment);
            },
            child: Text('수정'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              _deleteComment(comment);
              Navigator.pop(context);
            },
            isDestructiveAction: true,
            child: Text('삭제'),
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: Text('취소'),
        ),
      ),
    );
  }

  Comment _commentFromState(Post post, Comment? editComment) {
    final appUserStream = context.read(appUserStreamProvider);
    final appUser = appUserStream.data!.value!;
    final now = DateTime.now();
    return Comment(
      id: editComment != null ? editComment.id! : null,
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
        //final DocumentReference reference =
        final reference = await database.setComment(comment);
        await database.updateComment(comment.copyWith(id: reference.id));
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
        title: 'Operation failed',
        exception: e,
      ));
    }
  }

  // void _editPost(Post post) {
  //   try {
  //     final database = context.read(databaseProvider);
  //     database.updatePost(post);
  //   } catch (e) {
  //     unawaited(showExceptionAlertDialog(
  //       context: context,
  //       title: 'Operation failed',
  //       exception: e,
  //     ));
  //   }
  // }
  void _addReadUsers(Post post) {
    final appUser = context.read(appUserProvider);
    print('_addReadUsers appUser: ${appUser.id} / ${appUser.displayName}');
    if (appUser.id == null) {
      return;
    } else if (!post.readUsers.contains(appUser.id)) {
      final readUsers = post.readUsers;
      readUsers.add(appUser.id);

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
        title: 'Operation failed',
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

  void _deleteComment(Comment comment) {
    try {
      final database = context.read(databaseProvider);
      database.deleteComment(comment);
    } catch (e) {
      unawaited(showExceptionAlertDialog(
        context: context,
        title: 'Operation failed',
        exception: e,
      ));
    }
  }

  void showPreventCommentSnackBar(BuildContext context) =>
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(SnackBar(
          content: Text('Please write a comment'),
          duration: Duration(milliseconds: 300),
        ));
}
