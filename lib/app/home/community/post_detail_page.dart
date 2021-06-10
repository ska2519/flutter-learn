import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/home/community/post_list_item.dart';
import 'package:flutter_learn/app/widgets/avatar.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
  late Post post;

  @override
  void initState() {
    super.initState();
    post = widget.post;
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
      body: PostListItem(
        post: widget.post,
        postUserInfo: false,
      ),
    );
  }
}
