import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:tailor_app/features/home-page/presentation/ui/widgets/drawer-menu.dart';
import 'package:tailor_app/models/HomeScreenModel.dart';
import 'package:velocity_x/velocity_x.dart';

class DashBoardScreen extends StatefulWidget {
  DashBoardScreen({Key key, this.authToken}) : super(key: key);
  final String authToken;

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  bool showLoading = true;
  final http.Client httpClient = http.Client();
  HomeScreenModel homeScreenModel;
  Future<void> getData() async {
    final url = "https://softalogics.com/tailor/api/dashboard";
    final encodedUrl = Uri.encodeFull(url);
    print("Api Called");
    final response = await httpClient.get(Uri.parse(encodedUrl), headers: {
      HttpHeaders.authorizationHeader: "Bearer ${widget.authToken}"
    });
    print("Response ========== ${response.body}");
    if (response.statusCode == 200) {
      homeScreenModel = HomeScreenModel.fromJson(json.decode(response.body));
      setState(() {
        showLoading = false;
      });
    } else {
      print(response.body);

      setState(() {
        showLoading = false;
      });
    }
  }

  @override
  void initState() {

    super.initState();
    getData();
    ForegroundNotifi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFB19069),
        title: Padding(
          padding: const EdgeInsets.only(right: 90),
          child: Text('Book Tailor').text.uppercase.size(20).bold.white.make(),
        ),
      ),
      drawer: DrawerScreen(
        authToken: widget.authToken,
      ),
      //backgroundColor: Color(0xFFedeeef),

      body: showLoading
          ? Center(
              child: CupertinoActivityIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 50.0,left: 8.0,right: 8.0),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: 4,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            setTitle(index),
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          Text(
                            setAmount(index),
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: colorAccordingToStatus(index),
                          borderRadius: BorderRadius.circular(2)),
                    );
                  }),
            ),
    );
  }

  Color colorAccordingToStatus(int index) {
    if (index == 0) {
      return Color(0xFFB19069);
    } else if (index == 1) {
      return Color(0xFFB19069);
    } else if (index == 2) {
      return Color(0xFFB19069);
    } else {
      return Color(0xFFB19069);
    }
  }

  String setTitle(int index) {
    if (index == 0) {
      return "Accepted";
    } else if (index == 1) {
      return "Pending";
    } else if (index == 2) {
      return "Completed";
    } else {
      return "Cancelled";
    }
  }

  String setAmount(int index) {
    if (index == 0) {
      return homeScreenModel.accepted.toString();
    } else if (index == 1) {
      return homeScreenModel.pending.toString();
    } else if (index == 2) {
      return homeScreenModel.completed.toString();
    } else {
      return homeScreenModel.canceled.toString();
    }
  }
  ForegroundNotifi() async {

    print("Fcm");
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async{
      final title = message.notification.title ?? '';
      final body = message.notification.body ?? '';
      print('Got a message whilst in the foreground!');

      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

      var initializationSettingsAndroid =
      AndroidInitializationSettings('@drawable/appicon');
      var initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
      flutterLocalNotificationsPlugin.initialize(initializationSettings);


      var androidPlatformChannelSpecifics =
      AndroidNotificationDetails('100', 'DLite', 'DLite');
      var platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(
          100, title, body, platformChannelSpecifics);

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

  }
}
