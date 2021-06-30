import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'drawer-menu.dart';
import 'model/model-class.dart';

class GridDetail extends StatefulWidget {

  final Home home;
  const GridDetail({@required this.home});

  @override
  _GridDetailState createState() => _GridDetailState();
}

class _GridDetailState extends State<GridDetail> {
  List<Home> home=[];

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

      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: home.length,
          itemBuilder: (BuildContext context, int index) {
            print(home[index].title);
            return  Padding(
              padding: const EdgeInsets.all(0.0),
              child: Card(
                child: Container(
                  height: 70,
                  width: 60,
                  child:   ListTile(
                    title: Row(
                      children: [
                        Text(home[index].title).text.size(23).black.makeCentered().py20(),
                      ],
                    ),

                  ),
                ),
              ),
            );
          }
              ),
            );
          }
  }


//Widget getCard(){
//  return Padding(
//    padding: const EdgeInsets.all(0.0),
//    child: Card(
//child: Container(
//  height: 70,
//  width: 60,
//  child:   ListTile(
//      title: Row(
//        children: [
//          Text(home[index].title).text.size(23).black.makeCentered().py20(),
//        ],
//      ),
//
//),
//    ),
//  ),
//  );
//}