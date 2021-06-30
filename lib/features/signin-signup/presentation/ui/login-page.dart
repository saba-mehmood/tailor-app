import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tailor_app/features/home-page/presentation/ui/test.dart';
import 'package:tailor_app/features/signin-signup/presentation/state/api/api-service.dart';
import 'package:tailor_app/features/signin-signup/presentation/state/model/login-model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final scaffoldKey = GlobalKey<ScaffoldState>();
GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  LoginRequestModel requestModel;
  bool _isLoading = false;
  bool isApiCallProcess = false;


  @override
  void initState(){
    super.initState();
    requestModel = LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.teal],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: _isLoading ? Center(child: CircularProgressIndicator()) : ListView(
          children: <Widget>[
            headerSection(),
            textSection(),
            buttonSection(),
          ],
        ),
      ),
    );
  }


///login button method
  bool validateAndSave(){
    final form = globalFormKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
    return false;

  }
  
  Container buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(top: 15.0),
      child: RaisedButton(
          elevation: 0.0,
          color: Colors.purple,
          child: Text("Sign In", style: TextStyle(color: Colors.white70)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        onPressed:  () {
          if (validateAndSave()) {
            print(requestModel.toJson());
          }
          ApiService apiService = ApiService();
          apiService.login(requestModel).then((value) {
            setState(() {
              isApiCallProcess = false;
            });
            if (value.token.isNotEmpty) {
              final snackBar = SnackBar(content: Text('Login Successful'));
            } else {
              final snackBar = SnackBar(content: Text(value.error));
              scaffoldKey.currentState.showSnackBar(snackBar);
            }
          },

          );
        }),
          );
  }



  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            ///controller: emailController,
            cursorColor: Colors.white,
          validator: (input) => !input.contains('@')?"Email id should be valid":null,
onSaved: (input) => requestModel.email=input,
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.email, color: Colors.white70),
              hintText: "Email",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
          SizedBox(height: 30.0),
          TextFormField(
           /// controller: passwordController,
            onSaved: (input) => requestModel.password=input,
            validator: (input) => input.length < 3 ?"password should be more than 3 characters":null,
            cursorColor: Colors.white,
            obscureText: true,
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.white70),
              hintText: "Password",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }

  Container headerSection() {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Text("Code Land",
          style: TextStyle(
              color: Colors.white70,
              fontSize: 40.0,
              fontWeight: FontWeight.bold)),
    );
  }
  

}