import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_learn/app/top_level_providers.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:pedantic/pedantic.dart';

class NewPost extends HookWidget {
  //List<Post> posts = [];

  Future<void> newPost(BuildContext context, String text) async {
    final post = Post(body: text);
    try {
      final database = context.read(databaseProvider);

      await database.savePost(post);
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
            onPressed: () => newPost(context, 'test POst'),
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
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Subject',
                hintStyle: Theme.of(context).textTheme.button!.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black38),
              ),
            ),
            TextFormField(
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
