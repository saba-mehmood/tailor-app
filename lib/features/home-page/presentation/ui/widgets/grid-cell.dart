import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/model-class.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeCell extends StatelessWidget {

  @required
  final Home home;
  const HomeCell(this.home);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      color: Colors.white,
      child:  Container(
        color: Colors.white,
        height: 160,
        margin: EdgeInsets.only(left: 10.0, top: 10, right: 10.0),

        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: 50,
            height: 50,
            child: Text(home.title,maxLines: 1,softWrap: true,)
                .text
                .medium
                .size(20)
                .fontFamily('Roboto-Bold')
                .black
                .makeCentered()
               // .wh(40, 40)
                .py20(),
          ),
        ),
      ),
    );
  }
}
