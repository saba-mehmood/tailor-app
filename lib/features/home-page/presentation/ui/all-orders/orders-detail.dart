import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tailor_app/models/AllOrdersModel.dart';
import 'package:tailor_app/models/OrdersDetailModel.dart';
import 'styles.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

List<Widget> _renderInfo(BuildContext context, OrderDetailModel orderDetailModel){
  // ignore: deprecated_member_use
  var result = List<Widget>();
  result.add(_sectionTitle(orderDetailModel.orderNo ?? " "));
  result.add(_sectionText(orderDetailModel.address ?? " "));
  return result;
}

Widget _sectionTitle(String text){
  return Container(
      padding: EdgeInsets.fromLTRB(25.0,25.0,25.0,10.0),
      child: Text(text,
          textAlign: TextAlign.left,
          style: Styles.headerLarge));
}
Widget _sectionText(String text) {
  return Container(
      padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
      child: Text(text, style: Styles.textDefault,)
  );
}

class OrderDetails extends StatefulWidget {
  OrderDetails({Key key, this.authToken, this.iD}) : super(key: key);
  final String authToken;
  final int iD;
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {

  bool showLoading = true;
  String errorMessage;


  ///method
  final http.Client httpClient = http.Client();
  OrderDetailModel orderDetailModel;
  ///OrdersListModel ordersListModel;
  // ignore: missing_return
  Future<void> getInfo(int iD) async {
    final url = "https://softalogics.com/tailor/api/order-detail/$iD";
    final encodedUrl = Uri.encodeFull(url);
    final response = await httpClient.get(Uri.parse(encodedUrl), headers: {
      HttpHeaders.authorizationHeader: "Bearer ${widget.authToken}"
    });
    print("Response ========== ${response.body}");
    if (response.statusCode == 200) {
      orderDetailModel = OrderDetailModel.fromJson(json.decode(response.body));

      // print("Order List ====== ${ordersListModel.orders.length}");
      setState(() {
        showLoading = false;
      });
    } else {
      print(response.body);

      setState(() {
        showLoading = false;
      });
    }
  }
  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    getInfo(widget.iD);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFB19069),
        title: Padding(
          padding: const EdgeInsets.only(right: 90),
          child: Text('Order Detail').text.uppercase.size(20).bold.white.make(),
        ),
      ),
      body: showLoading
          ? Center(
        child: CupertinoActivityIndicator(),
      )
          : Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: _renderInfo(context, orderDetailModel),

          ),
    );
  }
}
