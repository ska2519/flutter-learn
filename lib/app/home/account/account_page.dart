import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/home/community/format.dart';
import 'package:flutter_learn/app/home/community/post_detail_page.dart';
import 'package:flutter_learn/models/comment.dart';
import 'package:flutter_learn/models/post_liked.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/models/read_post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pedantic/pedantic.dart';

import 'package:flutter_learn/app/sign_in/sign_in_page.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_alert_dialog.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
import 'package:flutter_learn/app/widgets/avatar.dart';
import 'package:flutter_learn/app/widgets/empty_content.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';

final userCommentsStreamProvider =
    StreamProvider.autoDispose<List<Comment>>((ref) {
  final database = ref.watch(databaseProvider);
  final appUser = ref.watch(appUserProvider);
  return database.userCommentsStream(appUser.id);
});
final readPostsStreamProvider =
    StreamProvider.autoDispose<List<ReadPost>>((ref) {
  final database = ref.watch(databaseProvider);
  final appUser = ref.watch(appUserProvider);
  return database.userReadPostsStream(appUser.id);
});
final likedPostsStreamProvider =
    StreamProvider.autoDispose<List<PostLiked>>((ref) {
  final database = ref.watch(databaseProvider);
  final appUser = ref.watch(appUserProvider);
  return database.userLikedPostsStream(appUser.id);
});

class AccountPage extends StatefulHookWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String _displayName = '';

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = context.read(authServiceProvider);
      await auth.signOut();
    } catch (e) {
      unawaited(showExceptionAlertDialog(
        context: context,
        title: LocaleKeys.signOutFailed.tr(),
        exception: e,
      ));
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final bool didRequestSignOut = await showAlertDialog(
          context: context,
          title: LocaleKeys.signOut.tr(),
          child: Text(LocaleKeys.sign_out_are_you_sure.tr()),
          cancelActionText: LocaleKeys.cancel.tr(),
          defaultActionText: LocaleKeys.signOut.tr(),
        ) ??
        false;
    if (didRequestSignOut == true) {
      await _signOut(context);
    }
  }

  Future<bool?> displayNameUpdateDialog(BuildContext context, AppUser appUser) {
    return showAlertDialog(
      context: context,
      title: LocaleKeys.my_profile.tr(),
      child: TextField(
        maxLength: 8,
        controller: TextEditingController(
            text: _displayName = appUser.displayName ?? ''),
        decoration:
            InputDecoration(hintText: LocaleKeys.write_name_you_want.tr()),
        onChanged: (displayName) => _displayName = displayName,
      ),
      cancelActionText: LocaleKeys.cancel.tr(),
      defaultActionText: LocaleKeys.ok.tr(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final appUserAsyncValue = useProvider(appUserStreamProvider);
    return appUserAsyncValue.when(
      data: (appUser) {
        print('AccountPage appUser.displayName: ${appUser?.displayName}');
        return Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: TextButton(
                  onPressed: () => appUser != null
                      ? _confirmSignOut(context)
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInPage(),
                          ),
                        ),
                  child: Text(
                    appUser != null
                        ? LocaleKeys.signOut.tr()
                        : LocaleKeys.signIn.tr(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(_size.height * 0.27),
              child: _buildUserInfo(appUser, context),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  if (appUser != null)
                    _buildUserComments(context)
                  else
                    const SizedBox(),
                  Divider(),
                  if (appUser != null)
                    _buildReadPosts(context)
                  else
                    const SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
      loading: () => const Scaffold(
        body: Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
      error: (_, __) => const Scaffold(
        body: EmptyContent(
          title: 'Something went wrong',
          message: "Can't load data right now.",
        ),
      ),
    );
  }

  Widget _buildUserInfo(AppUser? appUser, BuildContext context) {
    return Column(
      children: [
        Avatar(
          photoUrl: appUser?.photoURL,
          displayName: appUser?.displayName,
          radius: 50,
          borderColor: Colors.black54,
          borderWidth: 1.0,
        ),
        const SizedBox(height: defaultPadding),
        TextButton(
          onPressed: appUser == null
              ? null
              : () => displayNameUpdateDialog(context, appUser).then(
                    (value) {
                      if (value == true) {
                        final database = context.read(databaseProvider);
                        database.updateAppUser(
                          appUser.copyWith(displayName: _displayName),
                        );
                      }
                    },
                  ),
          child: Text(
            appUser == null
                ? LocaleKeys.requiredSignIn.tr()
                : appUser.displayName ?? LocaleKeys.makeAUsername.tr(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }
}

Widget _buildUserComments(BuildContext context) {
  final userCommentsAsyncValue = useProvider(userCommentsStreamProvider);
  final database = useProvider(databaseProvider);
  return userCommentsAsyncValue.when(
    loading: () => Center(child: const CupertinoActivityIndicator()),
    error: (error, stackTrace) => EmptyContent(
      title: '$error Something went wrong',
      message: "Can't load items right now",
    ),
    data: (userComments) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding),
            child: Text(
                userComments.isNotEmpty ? '최근 내가 작성한 댓글' : '작성한 댓글이 없어요 🙃'),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: userComments.length > 3 ? 3 : userComments.length,
            itemBuilder: (context, i) => GestureDetector(
              onTap: () =>
                  PostDetailPage.show(context, postId: userComments[i].postId),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FutureBuilder<Post?>(
                            future: database.getPost(userComments[i].postId),
                            builder: (context, snapshot) =>
                                snapshot.data != null
                                    ? Text(
                                        snapshot.data!.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(color: Colors.black87),
                                      )
                                    : const SizedBox(),
                          ),
                          Text(
                            Format.duration(userComments[i].timestamp!),
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: Colors.black87),
                          ),
                        ],
                      ),
                      Text(
                        userComments[i].text,
                        style: Theme.of(context).textTheme.bodyText1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

Widget _buildReadPosts(BuildContext context) {
  final readPostsAsyncValue = useProvider(readPostsStreamProvider);
  final database = useProvider(databaseProvider);
  return readPostsAsyncValue.when(
    loading: () => Center(child: const CupertinoActivityIndicator()),
    error: (error, stackTrace) => EmptyContent(
      title: '$error Something went wrong',
      message: "Can't load items right now",
    ),
    data: (readPosts) {
      print('accountPage readPosts: $readPosts');
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding),
            child:
                Text(readPosts.isNotEmpty ? '최근 내가 읽은 포스트' : '읽은 포스트가 없어요 🙃'),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: readPosts.length > 3 ? 3 : readPosts.length,
            itemBuilder: (context, i) => GestureDetector(
              onTap: () =>
                  PostDetailPage.show(context, postId: readPosts[i].postId),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FutureBuilder<Post?>(
                            future: database.getPost(readPosts[i].postId),
                            builder: (context, snapshot) =>
                                snapshot.data != null
                                    ? Text(
                                        snapshot.data!.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(color: Colors.black87),
                                      )
                                    : const SizedBox(),
                          ),
                          Text(
                            Format.duration(readPosts[i].timestamp!),
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: Colors.black87),
                          ),
                        ],
                      ),
                      // Text(
                      //   readPosts[i].text,
                      //   style: Theme.of(context).textTheme.bodyText1,
                      //   overflow: TextOverflow.ellipsis,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
