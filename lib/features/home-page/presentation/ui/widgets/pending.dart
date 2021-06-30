import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tailor_app/features/signin-signup/presentation/ui/signup.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

Future<Post> fetchPost() async {
  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

///model class
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}


class Pending extends StatefulWidget {
  @override
  _PendingState createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Post>(
      future: fetchPost(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GestureDetector(
            onTap: (){
              Get.to(SignUp());
            },
            child: Container(
              color: Colors.white,
              height: 160,
              margin: EdgeInsets.only(left: 10.0, top: 10, right: 10.0),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0,right: 20),
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Text(' ${snapshot.data.userId}')
                          .text
                          .medium
                          .size(30)
                          .fontFamily('Roboto-Bold')
                          .black
                          .makeCentered()
                          .wh(20, 20)
                          .py0(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('pending')
                            .text
                            .medium
                            .size(20)
                            .fontFamily('Roboto-Bold')
                            .black
                            .makeCentered()
                            .wh(20, 20)
                            .py1(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("Error : ${snapshot.error}");
        }
        // By default, show a loading spinner
        return CircularProgressIndicator();
      },
    );
  }
}
