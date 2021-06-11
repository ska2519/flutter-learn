import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/home/community/post_list_item.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
import 'package:flutter_learn/app/widgets/avatar.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/comment.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pedantic/pedantic.dart';

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
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;
  late Post post;
  String _comment = '';

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
    post = widget.post;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appUserStream = useProvider(appUserStreamProvider);
    final appUser = appUserStream.data?.value;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Avatar(photoUrl: appUser?.photoURL, radius: 19),
            SizedBox(width: defaultPadding),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.displayName,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  post.timestamp.toString(),
                  style: Theme.of(context).textTheme.overline,
                )
              ],
            ),
          ],
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
          Icon(
            Icons.notifications_off_outlined,
            color: flutterPrimaryColor,
            size: 20,
          ),
          SizedBox(width: defaultPadding),
          Icon(
            Icons.more_horiz,
            color: flutterPrimaryColor,
            size: 20,
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
                  PostListItem(
                    post: widget.post,
                    postUserInfo: false,
                  ),
                  Divider(),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.fromLTRB(
                        defaultPadding * 2,
                        defaultPadding,
                        defaultPadding,
                        defaultPadding,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Avatar(photoUrl: appUser?.photoURL, radius: 16),
                          SizedBox(width: defaultPadding),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'commenter.displayName',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                SizedBox(height: defaultPadding),
                                SelectableText(
                                  'dfasdfsadfadsfsadfasdfasd commenterdfa commentdfadsfa dfasdf dfd df er commenter commenter commenter commenter commenter commenter commenter commenter commenter ',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.all(0),
                            alignment: Alignment.topCenter,
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.more_horiz,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CupertinoTextField(
                  placeholder: 'Write a Comment',
                  focusNode: _focusNode,
                  controller: _textEditingController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  maxLength: 500,
                  expands: true,
                  textInputAction: TextInputAction.newline,
                  onChanged: (comment) => _comment = comment,
                  suffix: TextButton(
                    onPressed: () {
                      newComment(
                        context: context,
                        comment: _comment,
                        post: post,
                      ).then((value) {
                        _focusNode.unfocus();
                        _textEditingController.clear();
                      });
                    },
                    child: Text('POST'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Comment _commentFromState(Post post) {
    final appUserStream = context.read(appUserStreamProvider);
    final id = appUserStream.data!.value!.id;
    return Comment(
      postId: post.id,
      text: _comment,
      userId: id!,
    );
  }

  Future<void> newComment({
    required BuildContext context,
    required Post post,
    required String comment,
  }) async {
    try {
      final database = context.read(databaseProvider);
      final comment = _commentFromState(post);
      if (comment.text.isEmpty) {
        showPreventCommentSnackBar(context);
        return;
      }
      await database.setComment(comment);
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
        ..showSnackBar(SnackBar(content: Text('Please write a comment')));
}
