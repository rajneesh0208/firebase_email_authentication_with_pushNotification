import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> setupNotifications() async {
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      // if (message != null) {
      //    flutterLocalNotificationsPlugin.show(
      //       message.notification!.hashCode,
      //       message.notification!.title,
      //       message.notification!.body,
      //       NotificationDetails(
      //         android: AndroidNotificationDetails(
      //           'high_importance_channel', // id
      //           'High Importance Notifications', // title
      //           icon: 'assets/png/app_icon.png',
      //         ),
      //       ));
      // }
    });

    _showNotification();
  }

  Future<void> _showNotification() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            // payload: notification.body,
            const NotificationDetails(
              android: AndroidNotificationDetails(
                'high_importance_channel', // id
                'High Importance Notifications', // title
                icon: '@mipmap/ic_launcher',
                enableLights: true,
                enableVibration: true,
                playSound: true,
                // sound: RawResourceAndroidNotificationSound('notif_sound'),
              ),
            ));
      }
    });

    var androidInitialize = AndroidInitializationSettings("ic_launcher");
    var iOSInitialize;
    var initializeSettings =
        InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    flutterLocalNotificationsPlugin.initialize(
        initializeSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response){
          print(response);
      }
    );
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('A new onMessageOpenedApp event was published!$message');

    });
  }

  void onSelectionNotification(dynamic details) async {
    if (details.response != null) {
      // debugPrint('notification payload: $details');

    }
  }
}
