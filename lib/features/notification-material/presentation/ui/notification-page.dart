import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:tailor_app/features/notification-material/presentation/state/local-notification-services.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    LocalNotificationServices.initialize(context);

    ///gives you the message on which user taps
    /// and it opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if(message != null){
        final routeFromMessage = message.data['route'];
        Navigator.of(context).pushNamed(routeFromMessage);
      }
    });

   ///receiving notification form firebase
    ///this works only when app is on foreground
    FirebaseMessaging.onMessage.listen((message) {
      if(message.notification!= null){
        print(message.notification.body);
        print(message.notification.title);
      }
      LocalNotificationServices.display(message);
    });

    ///works when app is on background but opened and user tabs on notifications
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data['route'];
      Navigator.of(context).pushNamed(routeFromMessage);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
