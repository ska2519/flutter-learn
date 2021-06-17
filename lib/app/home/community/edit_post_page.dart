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
import 'package:flutter_learn/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

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
    final postId = widget.post?.id ?? '$currentDate:${appUser.id}';
    final displayName = appUserAsyncValue.data?.value?.displayName ?? '랜덤 아이디';
    final now = DateTime.now();
    final timestamp = widget.post?.timestamp ?? now;
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
        print('post: $post');
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
        title: LocaleKeys.operationFailed.tr(),
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
                  ? LocaleKeys.pleaseWriteTitle.tr()
                  : LocaleKeys.pleaseWriteContent.tr(),
            ),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.write_post.tr(),
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => _newPost(context, _title, _content),
            child: Text(
              LocaleKeys.post.tr(),
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
                hintText: LocaleKeys.title.tr(),
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
                hintText: LocaleKeys.shareQuestionsExperiences.tr(),
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
