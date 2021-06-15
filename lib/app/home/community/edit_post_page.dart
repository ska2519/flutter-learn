import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/app/home/community/post_detail_page.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pedantic/pedantic.dart';

import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';

class EditPostPage extends StatefulWidget {
  const EditPostPage({this.post});
  final Post? post;

  static Future<dynamic> show(BuildContext context, {Post? post}) async {
    await Navigator.of(context, rootNavigator: true).pushNamed(
      AppRoutes.editPostPage,
      arguments: post,
    );
  }

  @override
  _EditPostPageState createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage> {
  late String _title;
  late String _content;

  @override
  void initState() {
    super.initState();
    _title = widget.post?.title ?? '';
    _content = widget.post?.content ?? '';
  }

  Post _postFromState() {
    final appUserAsyncValue = context.read(appUserStreamProvider);
    final appUser = appUserAsyncValue.data!.value!;
    final currentDate = documentIdFromCurrentDate();
    final postId = '$currentDate:${appUser.id}';
    final displayName = appUserAsyncValue.data!.value!.displayName!;
    final now = DateTime.now();
    final timestamp = widget.post == null ? now : widget.post!.timestamp!;
    return Post(
      id: postId,
      userId: appUser.id!,
      displayName: displayName,
      title: _title,
      content: _content,
      timestamp: timestamp,
    );
  }

  Future<void> _newPost(BuildContext context, String title, String text) async {
    try {
      final database = context.read(databaseProvider);
      final post = _postFromState();
      if (post.title.isEmpty || post.content.isEmpty) {
        showPreventPostSnackBar(context, post.title);
        return;
      }
      if (widget.post != null) {
        await database.updatePost(post);
        Navigator.pop(context);
        return PostDetailPage.show(context, post: post);
      }
      await database.setPost(post);
      Navigator.pop(context);
      PostDetailPage.show(context, post: post);
    } catch (e) {
      unawaited(showExceptionAlertDialog(
        context: context,
        title: 'Operation failed',
        exception: e,
      ));
    }
  }

  void showPreventPostSnackBar(BuildContext context, String postTitle) =>
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(
          SnackBar(
            content: Text(
              postTitle.isEmpty
                  ? 'Please write a title'
                  : 'Please write a content',
            ),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '새글 작성',
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => _newPost(context, _title, _content),
            child: Text(
              'Post',
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: Colors.white),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding * 2),
        child: Column(
          children: [
            TextField(
              controller: TextEditingController(text: _title),
              onChanged: (title) => _title = title,
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: Theme.of(context).textTheme.button!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                    ),
              ),
            ),
            TextField(
              controller: TextEditingController(text: _content),
              onChanged: (content) => _content = content,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintMaxLines: 5,
                hintText:
                    'Share your questions or experiences.  \n\n \u{1f60e} Flutter Learn Community is for sharing information and experiences to help each other. Please be considerate of other people when writing.',
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.black38),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
