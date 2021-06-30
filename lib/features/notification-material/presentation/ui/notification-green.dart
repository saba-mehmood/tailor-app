import 'package:flutter/material.dart';

class NotificationGreen extends StatefulWidget {
  @override
  _NotificationGreenState createState() => _NotificationGreenState();
}

class _NotificationGreenState extends State<NotificationGreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.green,
      ),
    );
  }
}
