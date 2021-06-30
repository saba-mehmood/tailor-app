import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:tailor_app/features/notification-material/presentation/state/local-notification-services.dart';
import 'package:tailor_app/features/notification-material/presentation/ui/notification-page.dart';
import 'package:tailor_app/features/signin-signup/presentation/ui/login-page.dart';
import 'package:tailor_app/features/signin-signup/presentation/ui/signup.dart';
import 'features/home-page/presentation/ui/all-orders/all-orders.dart';
import 'features/home-page/presentation/ui/all-orders/orders.dart';
import 'features/home-page/presentation/ui/dashboard-screen.dart';
import 'features/home-page/presentation/ui/home.dart';
import 'package:get/get.dart';

import 'features/home-page/presentation/ui/test.dart';
import 'features/home-page/presentation/ui/widgets/grid-detail.dart';
import 'features/notification-material/presentation/ui/notification-green.dart';
import 'features/notification-material/presentation/ui/notification-red.dart';
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
