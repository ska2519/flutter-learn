import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
import 'package:flutter_learn/app/widgets/avatar.dart';
import 'package:flutter_learn/app/widgets/empty_content.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/chat.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';
import 'package:flutter_learn/utils/format.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'chat_page.dart';

final chatListStreamProvider = StreamProvider.autoDispose<List<Chat>>((ref) {
  final appUser = ref.read(appUserStreamProvider).data?.value;
  final database = ref.read(databaseProvider);
  final chatListStream = database.chatListStream(appUser!.id);

  return chatListStream.asyncMap((chatList) async {
    final chatUserList =
        await database.getUsersByList(getUserIds(chatList, appUser));

    for (var i = 0; i < chatList!.length; i++) {
      chatList[i] = chatList[i].copyWith(
        displayName: chatUserList[i].displayName,
        photoURL: chatUserList[i].photoURL,
      );
    }
    return chatList;
  });
});

class ChatListPage extends StatefulHookWidget {
  const ChatListPage({Key? key}) : super(key: key);
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true)
        .pushNamed(AppRoutes.chatListPage);
  }

  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('메시지')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: defaultPadding),
              _buildChatList(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildChatList(BuildContext context) {
  final chatListAsyncValue = useProvider(chatListStreamProvider);
  return chatListAsyncValue.when(
    loading: () => Center(child: CircularProgressIndicator()),
    error: (_, __) => EmptyContent(
      title: LocaleKeys.somethingWentWrong.tr(),
      message: LocaleKeys.cantLoadDataRightNow.tr(),
    ),
    data: (chatList) => _buildChatItem(chatList, context),
  );
}

Widget _buildChatItem(List<Chat> chatList, BuildContext context) {
  final textTheme = Theme.of(context).textTheme;
  final appUser = useProvider(appUserStreamProvider).data?.value;

  Future<void> _deleteChat(BuildContext context, Chat chat) async {
    final database = context.read(databaseProvider);
    try {
      await database.deleteChat(chat);
    } catch (e) {
      showExceptionAlertDialog(
        context: context,
        title: 'Operation failed',
        exception: e,
      );
    }
  }

  return ListView.separated(
    separatorBuilder: (context, index) => SizedBox(height: defaultPadding),
    shrinkWrap: true,
    itemCount: chatList.length,
    itemBuilder: (context, i) {
      return chatList.isEmpty
          ? SizedBox()
          : GestureDetector(
              onTap: () => ChatPage.show(
                context,
                idTo: checkIdTo(chatList[i], appUser!),
                displayName: chatList[i].displayName!,
              ),
              child: Dismissible(
                key: Key('chat-${chatList[i].id}'),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) => _deleteChat(context, chatList[i]),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(defaultPadding),
                      boxShadow: [
                        BoxShadow(color: iconThumbDefaultColor, blurRadius: 1)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Row(
                      children: [
                        Avatar(photoUrl: chatList[i].photoURL),
                        SizedBox(width: defaultPadding),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chatList[i].displayName!,
                                style: textTheme.bodyText1!.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                chatList[i].lastMessage.content!,
                                style: TextStyle(
                                  fontSize: 11.4,
                                  fontWeight: FontWeight.w300,
                                  color: textBody3Color,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          duration(chatList[i].lastMessage.timestamp!),
                          style: TextStyle(
                            fontSize: 11.4,
                            fontWeight: FontWeight.w300,
                            color: textBody2Color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
    },
  );
}

String checkIdTo(Chat chat, AppUser appUser) =>
    chat.userIds[0] != appUser.id ? chat.userIds[0] : chat.userIds[1];
