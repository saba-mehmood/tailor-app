import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tailor_app/features/home-page/presentation/ui/widgets/drawer-menu.dart';
import 'package:tailor_app/features/home-page/presentation/ui/widgets/grid-cell.dart';
import 'package:tailor_app/features/home-page/presentation/ui/widgets/model/model-class.dart';
import 'package:tailor_app/features/home-page/presentation/ui/widgets/network-request.dart';
import 'package:tailor_app/features/home-page/presentation/ui/widgets/pending.dart';
import 'package:tailor_app/features/signin-signup/presentation/ui/signin.dart';
import 'dart:async';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'widgets/grid-detail.dart';

///Future<Post> fetchPost() async {
///  final response =
///  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
///
///  if (response.statusCode == 200) {
///    // If the call to the server was successful, parse the JSON
///    return Post.fromJson(json.decode(response.body));
///  } else {
///    // If that call was not successful, throw an error.
///    throw Exception('Failed to load post');
///  }
///}
///
///class Post {
///  final int userId;
///  final int id;
///  final String title;
///  final String body;
///
///  Post({this.userId, this.id, this.title, this.body});
///
///  factory Post.fromJson(Map<String, dynamic> json) {
///    return Post(
///      userId: json['userId'],
///      id: json['id'],
///      title: json['title'],
///      body: json['body'],
///    );
///  }
///}
///
class ServiceCall extends StatefulWidget {
  ServiceCall({Key key, this.authToken}) : super(key: key);
  final String authToken;

  @override
  _ServiceCallState createState() => _ServiceCallState();
}

class _ServiceCallState extends State<ServiceCall> {
  ///creating gridview
  gridView(AsyncSnapshot<List<Home>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GridView.count(
        mainAxisSpacing: 6,
        childAspectRatio: 1,
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        children: snapshot.data.map((home) {
          return GestureDetector(
            child: GridTile(
              child: HomeCell(home),
            ),
            onTap: () {
              gotoDetailPage(context, home);
            },
          );
        }).toList(),
      ),
    );
  }

  ///on tap the grid view it will goes to listview
  gotoDetailPage(BuildContext context, Home home) {
    //Get.to(GridDetail());
    Get.to(() => GridDetail());
  }

  @override
  void initState() {
    print("Token ========${widget.authToken}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFFB19069),
          title: Padding(
            padding: const EdgeInsets.only(right: 90),
            child:
                Text('Tailor Shop').text.uppercase.size(20).bold.white.make(),
          ),
        ),
        drawer: DrawerScreen(
          authToken: widget.authToken,
        ),
        backgroundColor: Color(0xFFedeeef),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: FutureBuilder<List<Home>>(
                  future: NetworkRequest.fetchHome(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      return gridView(snapshot);
                    }
                    return CircularProgressIndicator();
                  }),
            ),
          ],

          /// child:  GridView(
          ///           children:[
          ///             Pending(),
          ///             Pending(),
          ///             Pending(),
          ///           //  Container(child: Text('USER ID : ${snapshot.data.userId}')),
          ///           //  Container(child: Text('USER ID : ${snapshot.data.userId}')),
          ///           //  Container(child: Text('USER ID : ${snapshot.data.userId}')),

          ///           ],

          ///           scrollDirection: Axis.vertical,
          ///           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          ///             mainAxisSpacing: 6,
          ///             childAspectRatio: 1,
          ///             crossAxisCount: 2,
          ///             crossAxisSpacing: 1,
          ///           ),

          ///         ),
        ));
  }
}
