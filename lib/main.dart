import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:rajneeshloginvalidation/LoginPage.dart';
import 'package:rajneeshloginvalidation/homescreen.dart';
import 'package:rajneeshloginvalidation/push_notification_service.dart';



Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");

}
Future<void> _messageHandler(RemoteMessage message) async {
  print('background message==================== ${message.notification!.body}');
}
final GlobalKey<NavigatorState> navigatorKey =  GlobalKey<NavigatorState>();


main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PushNotificationService().setupNotifications();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  String? token;
  FirebaseMessaging.instance.getToken().then((value) {
    token = value;
    debugPrint("=====fcm token===$token===============");
  });
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!======');
    print('Message data: ${message.data}');
    if (message.data.isNotEmpty) {}
  });
  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    print('Message clicked!==============');
    Navigator.push(navigatorKey.currentState!.context,
        MaterialPageRoute(builder: (context) => const HomeScreen()));
  });
  FirebaseMessaging.onBackgroundMessage(_messageHandler);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

