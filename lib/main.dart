import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_pushnotification/homescren.dart';
import 'package:overlay_support/overlay_support.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message codewaa: ${message.messageId}");
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
//most important thing is to initialise firebase in project
await Firebase.initializeApp();
// For handling notification when the app is in terminated state

  RemoteMessage? initialMessage  =
  await FirebaseMessaging.instance.getInitialMessage();
  if (initialMessage != null) {
    print(initialMessage);
    var notification = PushNotification(
      title: initialMessage.notification?.title,
      body: initialMessage.notification?.body,
      dataTitle: initialMessage.data['title'],
      dataBody: initialMessage.data['body'],
    );
  }

  runApp(const MyApp());
}

PushNotification({String? title, String? body, required dataTitle, required dataBody}) {
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          
          primarySwatch: Colors.blue,
        ),
        home: const Homescreen(),
      ),
    );
  }
}

