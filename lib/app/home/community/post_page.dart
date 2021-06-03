import 'package:flutter/material.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_learn/app/top_level_providers.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:pedantic/pedantic.dart';

class PostPage extends StatefulWidget {
  const PostPage({this.post});
  final Post? post;

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late String _title;
  late String _body;

  @override
  void initState() {
    super.initState();
    _title = widget.post?.title ?? '';
    _body = widget.post?.content ?? '';
  }

  Post _postFromState() {
    final authStateChanges = context.read(authStateChangesProvider);
    final id = widget.post?.postId ?? documentIdFromCurrentDate();
    return Post(
      postId: id,
      author: authStateChanges.data!.value!.displayName ?? '',
      title: _title,
      content: _body,
    );
  }

  Future<void> newPost(BuildContext context, String title, String text) async {
    try {
      final database = context.read(databaseProvider);
      final post = _postFromState();
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
            onPressed: () => newPost(context, _title, _body),
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
                hintText: 'Subject',
                hintStyle: Theme.of(context).textTheme.button!.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black38),
              ),
            ),
            TextFormField(
              controller: TextEditingController(text: _body),
              onChanged: (body) => _body = body,
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
