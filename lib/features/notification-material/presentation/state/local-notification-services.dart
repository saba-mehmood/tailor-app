

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


///creating channel to avoid the error on console the is 'Notification Channel requested (tailorapp) has not been created by the app'
///for foreground notification
class LocalNotificationServices {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context) {
    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"));
    _notificationsPlugin.initialize(initializationSettings,onSelectNotification: (String route) async{
      if(route !=null){
        Navigator.of(context).pushNamed(route);
      }
    });
  }

  ///create notification channel and also show notification
  static void display(RemoteMessage message) {

    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/1000;
      final NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "tailorapp",
          "tailorapp channel",
          "This is my channel",
          importance: Importance.max,
          priority: Priority.high,
        )
      );
      _notificationsPlugin.show(
          id,
          message.notification.title,
          message.notification.body,
          notificationDetails,
        payload: message.data['route'],
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
