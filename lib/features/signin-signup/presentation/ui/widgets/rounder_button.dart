import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tailor_app/features/home-page/presentation/ui/test.dart';
import 'package:tailor_app/features/signin-signup/presentation/ui/widgets/pallete.dart';
import 'package:http/http.dart' as http;

///class RoundedButton extends StatelessWidget {
///
///  const RoundedButton({
///    Key key,
///    @required this.buttonName,
///  }) : super(key: key);
///
///  final String buttonName;
///
///  @override
///  Widget build(BuildContext context) {
///
///    Size size = MediaQuery.of(context).size;
///    return Container(
///      height: size.height * 0.08,
///      width: size.width * 0.8,
///      decoration: BoxDecoration(
///        borderRadius:  BorderRadius.circular(0),
///        color: kBrown,
///      ),
///
///      child: TextButton(
///          onPressed: (){
///            setState(() {
///              _isLoading = true;
///            });
///            signIn(emailController.text, passwordController.text);
///      },
///          child: Text(
///            buttonName,
///            style: kBodyText.copyWith(fontWeight: FontWeight.bold),
///          )
///
///      ),
///
///    );
///  }
///}


class RoundedButton extends StatefulWidget {


  ///const RoundedButton({Key key, this.buttonName}) : super(key: key);
  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {


  bool _isLoading = false;
  ///controllers for email and pass
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(0),
        color: kBrown,
      ),

      child: TextButton(
          onPressed: (){
            setState(() {
              _isLoading = true;
            });
            /// signIn(emailController.text, passwordController.text);
          },
          child: Text(
           'SignIn',
            style: kBodyText.copyWith(fontWeight: FontWeight.bold),
          )

      ),

    );
  }
}


