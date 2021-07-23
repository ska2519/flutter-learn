import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: top_level_function_literal_block
final fcmProvider = FutureProvider.autoDispose((ref) async {
  print('fcmProvider START!!');
  final database = ref.read(databaseProvider);
  final fcm = FirebaseMessaging.instance;
  ref.maintainState = true;

  // Create a Foreground [AndroidNotificationChannel] for heads up notifications
  late AndroidNotificationChannel channel;
  // Initialize the [FlutterLocalNotificationsPlugin] package.
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      'This channel is used for important notifications.', // description
      importance: Importance.max,
    );
    if (Platform.isAndroid) {
      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
    } else if (Platform.isIOS) {
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
              alert: true, badge: true, sound: true);
    }
  }

  if (Platform.isIOS) {
    final NotificationSettings settings = await fcm.requestPermission(
      announcement: true,
      carPlay: true,
      criticalAlert: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');
  }

  final String? fcmToken = await fcm.getToken();
  print('fcmToken: $fcmToken');
  Future<void> saveTokenToDatabase(String token) async =>
      database.setToken(token);

  // Any time the token refreshes, store this in the database too.
  FirebaseMessaging.instance.onTokenRefresh.listen(saveTokenToDatabase);

  Future<void> setupInteractedPostUpdate() async {
    // Get any messages which caused the application to open from a terminated state.
    final RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat", navigate to a chat screen
    if (initialMessage != null
        //  && initialMessage.data['type'] == 'chat'
        ) {
      print('initialMessage1: $initialMessage');
      // PostDetailPage.show(context, postId: postId);
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final RemoteNotification? notification = message.notification;
      final AndroidNotification? android = message.notification?.android;
      //  final String largeIconPath = await _downloadAndSaveFile(
      //     'https://via.placeholder.com/128x128/00FF00/000000', 'largeIcon');

      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id, channel.name, channel.description,
              // largeIcon: FilePathAndroidBitmap(largeIconPath),
              icon: 'flutter_icon',
              // largeIcon:
              //     const DrawableResourceAndroidBitmap('sample_large_icon'),
              enableLights: true,
              color: flutterPrimaryColor,
              ledColor: flutterPrimaryColor,
              ledOnMs: 1000,
              ledOffMs: 500,
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      // Navigator.pushNamed(context, '/message',
      //     arguments: MessageArguments(message, true));
    });
  }

  ref.watch(appUserStreamProvider).when(
        data: (appUser) {
          print('saveTokenToDatabase START!!');
          saveTokenToDatabase(fcmToken!);
          setupInteractedPostUpdate();
        },
        loading: () => null,
        error: (error, stackTrace) => null,
      );
});
