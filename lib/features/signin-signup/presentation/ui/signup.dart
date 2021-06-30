import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widgets/dob.dart';
import 'widgets/gender.dart';
import 'widgets/pallete.dart';
import 'widgets/password_input.dart';
import 'widgets/rounder_button.dart';
import 'widgets/text-field_input.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        //background....
        Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock,
                      color: kBrown,
                      size: 37,
                    ),
                    WidthBox(5),
                    Text('Sign Up')
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
                    TextInputField(
                      icon: FontAwesomeIcons.user,
                      hint: 'Name',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      icon: FontAwesomeIcons.envelope,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                    ),
                    Password(
                      icon: FontAwesomeIcons.lock,
                      hint: 'Password',
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      icon: FontAwesomeIcons.phone,
                      hint: 'Phone',
                      inputType: TextInputType.number,
                      inputAction: TextInputAction.next,
                    ),
//calling class
                    DataOfBirth(),
//calling class
                    GenderSelection(),

                    SizedBox(
                      height: 10,
                    ),
                    RoundedButton(),
                    SizedBox(
                      height: 3,
                    ),
                //  Row(
                //    mainAxisAlignment: MainAxisAlignment.center,
                //    children: [

                //      GestureDetector(
                //        onTap: () {
                //          Navigator.pushNamed(context, 'SignIn');
                //        },
                //        child: Text(
                //          'SignIn',
                //          style: kBodyText
                //        ).text.color(kBrown).make()
                //      ),
                //    ],
                //  ),
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
}
