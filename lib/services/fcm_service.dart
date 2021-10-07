import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_learn/app/home/home_page.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/received_notification.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'firebase_auth_service.dart';
import 'firestore_database.dart';

final fcmServiceProvider = Provider<FCMService>((ref) => FCMService(ref.read));

class FCMService {
  FCMService(this._read);
  final Reader _read;
  final _fcm = FirebaseMessaging.instance;

  Future<String?> get getToken => _fcm.getToken();

  Future<String?> get webToken => _fcm.getToken(
      vapidKey:
          "BPvO3TOK1207AzrjYszUKNldgNOqYkPt6bCiuJPXQguueZAg9TZKpDY3642mcNNUx659d1BYH6VdyiaYX-qJeeA");

  Future<void> saveTokenToDatabase(String? token) async {
    final database = _read(databaseProvider);
    final appUser = _read(appUserStreamProvider).data?.value;
    if (appUser != null && token != null) database.setToken(appUser.id, token);
  }

  /// Get the token each time the application loads
  Future<void> saveAndRefreshToken() async {
    final String? token = kIsWeb ? await webToken : await getToken;
    if (token != null) await saveTokenToDatabase(token);
    debugPrint('fcm_token: $token');
    // Any time the token refreshes, store this in the database too.
    _fcm.onTokenRefresh.listen(saveTokenToDatabase);
  }

  Future<void> setupInteractedPost() async {
    late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
    late AndroidNotificationChannel channel;
    await saveAndRefreshToken();
    if (!kIsWeb) {
      //  Create Android a Foreground [AndroidNotificationChannel] for heads up notifications
      channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        'This channel is used for important notifications.', // description
        importance: Importance.max,
      );

      // Initialize the [FlutterLocalNotificationsPlugin] package.
      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
              alert: true, badge: true, sound: true);
    }
    // iOS
    final NotificationSettings settings = await _fcm.requestPermission(
      announcement: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
    );
    print('fcm_User granted permission: ${settings.authorizationStatus}');

    // Get any messages which caused the application to open from a terminated state.
    final RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat", navigate to a chat screen
    if (initialMessage != null && initialMessage.data.keys.first == 'postId') {
      if (initialMessage.data.isNotEmpty) {
        print('fcm_initialMessage.keys.1: ${initialMessage.data.keys.first}');
        print(
            'fcm_initialMessage.values.1: ${initialMessage.data.values.first}');
        // _read(fcmDataProvider).state = initialMessage.data;
      }
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final RemoteNotification? notification = message.notification;
      final AndroidNotification? android = message.notification?.android;
      //  final String largeIconPath = await _downloadAndSaveFile(
      //     'https://via.placeholder.com/128x128/00FF00/000000', 'largeIcon');
      print('fcm_message.notification: ${message.notification!.title}');
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
              importance: Importance.max,
              priority: Priority.max,
              // fullScreenIntent: true,
            ),
          ),
          payload: 'item x',
        );
      }
      if (message.data.isNotEmpty) {
        print('fcm_onMessage.listen.keys.1: ${message.data.keys.first}');
        print('fcm_onMessage.listen.values.1: ${message.data.values.first}');
        // _read(fcmDataProvider).state = message.data;
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) async {
        final didReceiveLocalNotificationProvider =
            StateProvider<ReceivedNotification?>((ref) => null);

        final selectNotificationProvider =
            StateProvider<String?>((ref) => null);

        const AndroidInitializationSettings initializationSettingsAndroid =
            AndroidInitializationSettings('flutter_icon');

        /// Note: permissions aren't requested here just to demonstrate that can be done later
        final IOSInitializationSettings initializationSettingsIOS =
            IOSInitializationSettings(onDidReceiveLocalNotification:
                (int id, String? title, String? body, String? payload) async {
          ProviderContainer().read(didReceiveLocalNotificationProvider).state =
              ReceivedNotification(
            id: id,
            title: title,
            body: body,
            payload: payload,
          );
        });
        const MacOSInitializationSettings initializationSettingsMacOS =
            MacOSInitializationSettings(
                requestAlertPermission: false,
                requestBadgePermission: false,
                requestSoundPermission: false);

        final InitializationSettings initializationSettings =
            InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
          macOS: initializationSettingsMacOS,
        );
        await flutterLocalNotificationsPlugin.initialize(initializationSettings,
            onSelectNotification: (String? payload) async {
          if (payload != null) {
            debugPrint('fcm_notification payload: $payload');
          }
          // selectedNotificationPayload = payload;
          ProviderContainer().read(selectNotificationProvider).state = payload;
        });

        if (message.data.isNotEmpty) {
          final messageData = message.data;
          print('fcm_messageData.keys.1: ${messageData.keys.first}');
          print('fcm_messageData.values.1: ${messageData.values.first}');
          if (messageData.keys.first == 'postId') {
            final postId = messageData.values.first.toString();
            _read(fcmModelProvider.notifier).setPageOpenPostId(postId);
          }
        }
      },
    );
  }
}
