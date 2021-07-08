import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/signin-signup/presentation/ui/signin.dart';
import 'package:firebase_core/firebase_core.dart';

///Receive message when app is in background solution for on message
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignIn(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => SignIn(),
      //   'OrderScreen': (context) => OrderScreen(),
      //   'DashBoardScreen': (context) => DashBoardScreen(),
      //   'ServiceCall': (context) => ServiceCall(),
      //   'NotificationGreen': (context) => NotificationGreen(),
      //   'NotificationRed': (context) => NotificationRed(),
      //   'GridDetail': (context) => GridDetail(),

      //   //'HomeScreen':(context) => HomeScreen,
      //   //'ForgotPassword': (context) => ForgotPassword(),
      //   //'CreateNewAccount': (context) => CreateNewAccount(),
      // },
    );
  }
}
