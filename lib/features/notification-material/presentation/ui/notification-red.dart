import 'package:flutter/material.dart';

class NotificationRed extends StatefulWidget {
  @override
  _NotificationRedState createState() => _NotificationRedState();
}

class _NotificationRedState extends State<NotificationRed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
