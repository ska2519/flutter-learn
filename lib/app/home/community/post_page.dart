import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pedantic/pedantic.dart';

import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:uuid/uuid.dart';

class PostPage extends StatefulWidget {
  const PostPage({this.post});
  final Post? post;

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late String _title;
  late String _content;

  @override
  void initState() {
    super.initState();
    _title = widget.post?.title ?? '';
    _content = widget.post?.content ?? '';
  }

  Post _postFromState() {
    final authStateChanges = context.read(authStateChangesProvider);
    final currentDate = widget.post?.id ?? documentIdFromCurrentDate();
    final uid = authStateChanges.data!.value!.uid;
    final displayName = authStateChanges.data!.value!.displayName!;
    final id = '$currentDate:$uid';
    final now = DateTime.now();
    return Post(
      id: id,
      userId: uid,
      displayName: displayName,
      title: _title,
      content: _content,
      timestamp: now,
    );
  }

  Future<void> newPost(BuildContext context, String title, String text) async {
    try {
      final database = context.read(databaseProvider);
      final post = _postFromState();
      if (post.title.isEmpty || post.content.isEmpty) {
        showPreventPostSnackBar(context, post.title);
        return;
      }
      await database.setPost(post);

      Navigator.of(context).pop();
    } catch (e) {
      unawaited(showExceptionAlertDialog(
        context: context,
        title: 'Operation failed',
        exception: e,
      ));
    }
    //posts.add(post);
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
            onPressed: () => newPost(context, _title, _content),
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
                    fontWeight: FontWeight.bold, color: Colors.black38),
              ),
            ),
            TextFormField(
              controller: TextEditingController(text: _content),
              onChanged: (body) => _content = body,
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
