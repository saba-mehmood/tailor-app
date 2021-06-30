import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'widgets/drawer-menu.dart';
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

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFB19069),
        title: Padding(
          padding: const EdgeInsets.only(right: 90),
          child: Text('Tailor Shop').text.uppercase.size(20).bold.white.make(),
        ),
      ),
      drawer: DrawerScreen(),
      backgroundColor: Color(0xFFedeeef),
      body: Container(
        child: FutureBuilder<Post>(
          future: fetchPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView(
                children: [
                  Container(
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
                  Container(
                    color: Colors.white,
                    height: 160,
                    margin: EdgeInsets.only(left: 10.0, top: 10, right: 10.0),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Container(
                            width: 80,
                            height: 50,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Total orders')
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
                  Container(
                    color: Colors.white,
                    height: 160,
                    margin: EdgeInsets.only(left: 10.0, top: 10, right: 10.0),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Container(
                            width: 80,
                            height: 50,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Total orders')
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
                  Container(
                    color: Colors.white,
                    height: 160,
                    margin: EdgeInsets.only(left: 10.0, top: 10, right: 10.0),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Container(
                            width: 80,
                            height: 50,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Total orders')
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
                ],
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 6,
                  childAspectRatio: 1,
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                ),
              );
            } else if (snapshot.hasError) {
              return Text("Error : ${snapshot.error}");
            }
            // By default, show a loading spinner
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
