import 'package:bubble/bubble.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
import 'package:flutter_learn/app/widgets/empty_content.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/chat.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';
import 'package:flutter_learn/utils/format.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final messagesStreamProvider =
    StreamProvider.autoDispose.family<List<Message>, String>((ref, idTo) {
  final database = ref.watch(databaseProvider);
  return ref.watch(appUserStreamProvider).when(
        data: (appUser) {
          final chatId = getChatId(appUser!.id, idTo);
          return database.messagesStream(chatId);
        },
        loading: () => Stream<List<Message>>.empty(),
        error: (error, stackTrace) => Stream<List<Message>>.empty(),
      );
});

class ChatPage extends StatefulHookWidget {
  const ChatPage({
    Key? key,
    required this.idTo,
    required this.displayName,
  }) : super(key: key);
  final String idTo;
  final String displayName;

  static Future<void> show(BuildContext context,
      {required String idTo, required String displayName}) async {
    await Navigator.of(context, rootNavigator: true).pushNamed(
      AppRoutes.chatPage,
      arguments: {'idTo': idTo, 'displayName': displayName},
    );
  }

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String get idTo => widget.idTo;
  String get displayName => widget.displayName;
  late TextEditingController _textEditingController;
  late ScrollController _listScrollController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _listScrollController = ScrollController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _listScrollController.dispose();
    super.dispose();
  }

  Chat _chatFromState() {
    final appUser = context.read(appUserStreamProvider).data?.value;
    final now = DateTime.now();
    return Chat(
      id: getChatId(appUser!.id, idTo),
      userIds: [appUser.id, idTo],
      lastMessage: Message(
        idFrom: appUser.id,
        idTo: idTo,
        timestamp: now,
        content: _textEditingController.text.trim(),
      ),
    );
  }

  void _sendMessage(BuildContext context) {
    try {
      if (_textEditingController.text.trim() != '') {
        final chat = _chatFromState();
        final database = context.read(databaseProvider);
        database.setChat(chat).whenComplete(() => database.addMessage(chat));
        _textEditingController.clear();
        _listScrollController.animateTo(0.0,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      }
    } catch (e) {
      showExceptionAlertDialog(
        context: context,
        title: 'Operation failed',
        exception: e,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: bgSpaceGrayColor,
        appBar: AppBar(title: Text(displayName)),
        body: SafeArea(
          child: Column(
            children: [
              _buildMessages(),
              _buildInput(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessages() {
    final messagesAsyncValue = useProvider(messagesStreamProvider(idTo));
    return Expanded(
      child: messagesAsyncValue.when(
        loading: () => Center(child: const CupertinoActivityIndicator()),
        error: (_, __) => EmptyContent(
          title: LocaleKeys.somethingWentWrong.tr(),
          message: LocaleKeys.cantLoadDataRightNow.tr(),
        ),
        data: (messages) {
          final appUser = useProvider(appUserStreamProvider).data!.value!;
          return ListView.builder(
            shrinkWrap: true,
            reverse: true,
            controller: _listScrollController,
            itemCount: messages.length,
            padding: const EdgeInsets.all(10.0),
            itemBuilder: (context, i) {
              final msg = messages[i];
              if (!msg.read && msg.idTo == appUser.id) {
                context
                    .read(databaseProvider)
                    .updateMessageRead(msg, getChatId(msg.idFrom!, msg.idTo!));
              }
              if (messages[i].idFrom == appUser.id) {
                // Right (my message)
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Text(
                          date(msg.timestamp!, 'hh:mm a'),
                          style: TextStyle(
                            color: textBody2Color,
                            fontSize: size1 * 36,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: 13)
                      ],
                    ),
                    Flexible(
                      child: Bubble(
                        margin: const BubbleEdges.all(defaultPadding),
                        padding: const BubbleEdges.all(defaultPadding),
                        stick: true,
                        color: Color(0xFFE6DDFF),
                        elevation: 0,
                        nip: BubbleNip.rightBottom,
                        radius: Radius.circular(13),
                        child: Text(
                          msg.content!,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: textH1Color,
                            fontSize: size1 * 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                // Left (peer message)
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Bubble(
                            margin: const BubbleEdges.all(defaultPadding),
                            padding: const BubbleEdges.all(defaultPadding),
                            stick: true,
                            color: Color(0xFFE6E6E8),
                            elevation: 0,
                            nip: BubbleNip.leftBottom,
                            radius: Radius.circular(13),
                            child: Text(
                              msg.content ?? '',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: textH1Color,
                                fontSize: size1 * 40,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              date(msg.timestamp!, 'hh:mm a'),
                              style: TextStyle(
                                color: textBody2Color,
                                fontSize: size1 * 36,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(height: 13)
                          ],
                        ),
                      ],
                    )
                  ],
                );
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildInput() {
    return Container(
      height: 60,
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(
          defaultViewPadding, 8, defaultViewPadding, 8),
      child: CupertinoTextField(
        placeholder: '메시지를 입력하세요',
        placeholderStyle: TextStyle(
          color: Color(0xFF9386AE),
          fontSize: 14.25,
          fontWeight: FontWeight.w300,
        ),
        controller: _textEditingController,
        maxLength: 500,
        textInputAction: TextInputAction.newline,
        decoration: BoxDecoration(
          color: bgCardGrayColor,
          borderRadius: BorderRadius.circular(50),
        ),
        prefix: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/icons/btn_image.png',
              height: 22,
            ),
          ),
        ),
        suffix: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: GestureDetector(
            onTap: () => _sendMessage(context),
            child: Image.asset('assets/icons/btn_send.png', height: 22),
          ),
        ),
      ),
    );
  }
}
