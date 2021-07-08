import 'package:flutter/material.dart';
import 'package:tailor_app/features/home-page/presentation/ui/all-orders/all-orders.dart';
import 'package:tailor_app/features/home-page/presentation/ui/all-orders/order-detail.dart';
import 'package:tailor_app/features/home-page/presentation/ui/all-orders/orders.dart';
import 'package:tailor_app/features/home-page/presentation/ui/dashboard-screen.dart';
import 'package:tailor_app/features/home-page/presentation/ui/home.dart';
import 'package:tailor_app/features/signin-signup/presentation/ui/signin.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreen extends StatefulWidget {
  DrawerScreen({Key key, this.authToken}) : super(key: key);
  final String authToken;

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  ///for logout
  SharedPreferences sharedPreferences;

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => SignIn()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFFB19069),
        child: ListView(children: [
          Text('Tailor Shop')
              .text
              .size(30)
              .bold
              .white
              .makeCentered()
              .wh(180, 180),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DashBoardScreen(
                    authToken: widget.authToken,
                  ),
                ),
              );
            },
            child: ListTile(
              title: Text('Home').text.white.size(20).make(),
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
          ),
          Divider(
            height: 5,
            thickness: 0.5,
            color: Colors.white.withOpacity(0.9),
            indent: 32,
            endIndent: 32,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OrderScreen(
                          authToken: widget.authToken,
                        )),
              );
            },
            child: ListTile(
              title: Text('All Orders').text.white.size(20).make(),
              leading: Icon(Icons.shopping_cart, color: Colors.white),
            ),
          ),
          Divider(
            height: 5,
            thickness: 0.5,
            color: Colors.white.withOpacity(0.9),
            indent: 32,
            endIndent: 32,
          ),
          InkWell(
            onTap: () {
              checkLoginStatus();
              // sharedPreferences.clear();
              // sharedPreferences.commit();
              // @override
              // void initState() {
              //   super.initState();
              //   checkLoginStatus();
              // }
              /// Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
              ///     builder: (BuildContext context) => SignIn()), (
              ///     Route<dynamic> route) => false);
            },
            child: ListTile(
              title: Text('Log Out').text.white.size(20).make(),
              leading: Icon(Icons.vpn_key, color: Colors.white),
            ),
          ),
          Divider(
            height: 5,
            thickness: 0.5,
            color: Colors.white.withOpacity(0.9),
            indent: 32,
            endIndent: 32,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderInfo(
                    authToken: widget.authToken,
                  ),
                ),
              );
            },
            child: ListTile(
              title: Text('Rate Us').text.white.size(20).make(),
              leading: Icon(Icons.star, color: Colors.white),
            ),
          ),
          Divider(
            height: 5,
            thickness: 0.5,
            color: Colors.white.withOpacity(0.9),
            indent: 32,
            endIndent: 32,
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Share the App').text.white.size(20).make(),
              leading: Icon(Icons.share, color: Colors.white),
            ),
          ),
          Divider(
            height: 5,
            thickness: 0.5,
            color: Colors.white.withOpacity(0.9),
            indent: 32,
            endIndent: 32,
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('About Us').text.white.size(20).make(),
              leading: Icon(Icons.info, color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}
