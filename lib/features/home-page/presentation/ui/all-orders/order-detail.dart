import 'package:flutter/material.dart';
import 'styles.dart';
import 'model/model-allorders.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderDetail extends StatelessWidget {
  final Order order;

  const OrderDetail( this.order);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFFB19069),
          title: Padding(
            padding: const EdgeInsets.only(right: 90),
            child: Text(order.title, ).text.size(20).maxLines(1).make(),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderBody(context, order),
        )
    );
  }

  List<Widget> _renderBody(BuildContext context, Order order){
    var result = List<Widget>();
    result.add(_bannerImage(order.url, 170.0));
    result.addAll(_renderInfo(context, order));
    return result;
  }

  List<Widget> _renderInfo(BuildContext context, Order order){
    var result = List<Widget>();
    result.add(_sectionTitle(order.title));
    result.add(_sectionText(order.description));
    return result;
  }

  Widget _sectionTitle(String text){
    return Container(
        padding: EdgeInsets.fromLTRB(25.0,25.0,25.0,10.0),
        child: Text(text,
            textAlign: TextAlign.left,
            style: Styles.headerLarge));
  }
  Widget _sectionText(String text){
    return Container(
        padding: EdgeInsets.fromLTRB(25.0,15.0,25.0,15.0),
        child:Text(text, style: Styles.textDefault,)
    );
  }

  Widget _bannerImage(String url, double height){
    return Container(
        constraints: BoxConstraints.tightFor(height: height),
        child: Image.network(url, fit: BoxFit.fitWidth)
    );
  }
}
