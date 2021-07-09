import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/app/home/community/post_detail_page.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pedantic/pedantic.dart';

class EditPostPage extends StatefulWidget {
  const EditPostPage({this.post, this.autoFocus});
  final Post? post;
  final bool? autoFocus;

  static Future<dynamic> show(BuildContext context,
      {Post? post, bool? autoFocus}) async {
    await Navigator.of(context, rootNavigator: true).pushNamed(
      AppRoutes.editPostPage,
      arguments: {'post': post, 'autoFocus': autoFocus},
    );
  }

  @override
  _EditPostPageState createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage> {
  late String _title;
  late String _content;
  late Post? post;
  late bool autoFocus = false;

  @override
  void initState() {
    super.initState();
    post = widget.post;
    _title = widget.post?.title ?? '';
    _content = widget.post?.content ?? '';
    if (widget.autoFocus != null) autoFocus = widget.autoFocus!;
  }

  Post _postFromState() {
    final appUser = context.read(appUserStreamProvider).data?.value;
    final currentDate = documentIdFromCurrentDate().substring(0, 19);
    final postId = post?.id ?? '$currentDate:${appUser?.id}';
    final userDisplayName = appUser?.displayName;
    final now = DateTime.now();
    final timestamp = post?.timestamp ?? now;
    return Post(
      id: postId,
      userId: appUser!.id!,
      userDisplayName: userDisplayName,
      title: _title,
      content: _content,
      timestamp: timestamp,
      commentCount: post?.commentCount ?? 0,
      likedCount: post?.likedCount ?? 0,
      readCount: post?.readCount ?? 0,
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

      widget.post != null
          ? await database.updatePost(post)
          : await database.setPost(post);
      // await database.updatePost(post.copyWith(id: documentReference.id));
      Navigator.pop(context);
      PostDetailPage.show(context, postId: post.id);
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
          LocaleKeys.writePost.tr(),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding * 2),
          child: Column(
            children: [
              TextField(
                autofocus: autoFocus,
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
      ),
    );
  }
}
