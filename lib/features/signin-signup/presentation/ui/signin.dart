import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tailor_app/features/home-page/presentation/ui/dashboard-screen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'widgets/pallete.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final http.Client httpClient = http.Client();
  String _accessToken = "";
  bool _isLoading = false;
  String email;
  String password;

  ///controllers for email and pass
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        //background....
        Scaffold(
          backgroundColor: Colors.white,
          body: _isLoading
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.width * 0.4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.vpn_key,
                            color: kBrown,
                            size: 37,
                          ),
                          WidthBox(5),
                          Text('Sign In')
                              .text
                              .color(kBrown)
                              //.fontFamily('Roboto Condensed')
                              .semiBold
                              .size(35)
                              .makeCentered(),
                        ],
                      ),
                      SizedBox(
                        height: size.width * 0.1,
                      ),
                      Column(
                        children: [
                          Container(
                            height: size.height * 0.08,
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              color: Colors.grey[500].withOpacity(0.5),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: TextFormField(
                              controller: emailController,
                              cursorColor: Colors.black,
                              onChanged: (value) {
                                email = value;
                              },
                              style: TextStyle(color: Colors.black54),
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Icon(Icons.email,
                                      size: 28, color: kWhite),
                                ),
                                hintText: "Email",
                                border: InputBorder.none,
                                hintStyle: kBodyText,
                              ),
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              height: size.height * 0.08,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.grey[500].withOpacity(0.5),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: TextFormField(
                                controller: passwordController,
                                cursorColor: Colors.black,
                                obscureText: true,
                                onChanged: (value) {
                                  password = value;
                                },
                                style: TextStyle(color: Colors.black54),
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Icon(Icons.lock,
                                        size: 28, color: kWhite),
                                  ),
                                  hintText: "Password",
                                  border: InputBorder.none,
                                  hintStyle: kBodyText,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 25,
                          ),

                          ///signin button
                          //////emailController.text == "" || passwordController.text == "" ? null :
                          Container(
                            height: size.height * 0.08,
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: kBrown,
                            ),

                            // ignore: deprecated_member_use
                            child: RaisedButton(
                                color: kBrown,
                                onPressed: () async {

                                  setState(() {
                                    _isLoading = true;
                                    email = emailController.text.trim();
                                    password = passwordController.text.trim();
                                  });
                                  await login();
                                },
                                child: Text(
                                  'SignIn',
                                  style: kBodyText.copyWith(
                                      fontWeight: FontWeight.bold),
                                )),
                          ),

                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    Navigator.pushNamed(context, 'SignUp'),
                                child: Container(
                                  child: Text('Create New Account',
                                          style: kBodyText)
                                      .text
                                      .black
                                      .size(20)
                                      .make(),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
        )
      ],
    );
  }



  ///loginmethod
  Map<String, String> get _headerOption => {"Content-Type": "application/json"};

  /// Future<void> login() async {

  ///   Map<String, String> bodyParamsMap = {
  ///     "email": "bsyed6583@gmail.com",
  ///     "password": "123456"
  ///   };

  ///   final encodedBody = json.encode(bodyParamsMap);
  ///   final response = await httpClient.post(
  ///       Uri.parse("https://softalogics.com/tailor/api/login"),
  ///     body: encodedBody,
  ///     headers: _headerOption,
  ///   );
  ///   if (response.statusCode == 200) {
  ///     var data = json.decode(response.body);
  ///     print(json.decode(response.body));
  ///     //Fixme: store access token somewhere else [pref,sambast,sqllite],request for token when user login into app.
  ///     setState(() {
  ///       _accessToken=json.decode(response.body)['access_token'];
  ///     });
  ///     // Navigator used to enter inside app if the authentication is correct
  ///     Navigator.of(context).pushAndRemoveUntil(
  ///         MaterialPageRoute(
  ///           builder: (BuildContext context) => ServiceCall(),
  ///         ),
  ///             (Route<dynamic> route) => false);
  ///   } else {
  ///     print("handle error");
  ///   }
  /// }

  Future<void> login() async {
    Map<String, String> bodyParamsMap = {
      "email": "$email",
      "password": "$password"

    };

    final encodedBody = json.encode(bodyParamsMap);
    final response = await httpClient.post(
      Uri.parse("https://softalogics.com/tailor/api/login"),
      body: encodedBody,
      headers: _headerOption,
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(json.decode(response.body));
//Fixme: store access token somewhere else [pref,sambast,sqllite],request for token when user login into app.

      _accessToken = data["access_token"];
      print("Access Token is = $_accessToken");
// Navigator used to enter inside app if the authentication is correct
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) => DashBoardScreen(
              authToken: _accessToken,
            ),
          ),
          (Route<dynamic> route) => false);
    } else {
      print("handle error");
    }
  }
}
