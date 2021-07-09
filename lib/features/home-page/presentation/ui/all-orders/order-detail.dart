import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tailor_app/models/AllOrdersModel.dart';
import 'package:tailor_app/models/OrdersDetailModel.dart';
import 'styles.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

///class OrderDetail extends StatelessWidget {
/// OrderDetail({Key key, this.authToken}) : super(key: key);
/// final String authToken;


/// @override
/// Widget build(BuildContext context) {
///   return Scaffold(
///       appBar: AppBar(
///         elevation: 0.0,
///         backgroundColor: Color(0xFFB19069),
///         title: Padding(
///           padding: const EdgeInsets.only(right: 90),
///           child: Text(order.title, ).text.size(20).maxLines(1).make(),
///         ),
///       ),
///       body: Column(
///         mainAxisAlignment: MainAxisAlignment.start,
///         crossAxisAlignment: CrossAxisAlignment.stretch,
///         children: _renderBody(context, order),
///       )
///   );
/// }

/// List<Widget> _renderBody(BuildContext context, Order order){
///   var result = List<Widget>();
///   result.add(_bannerImage(order.url, 170.0));
///   result.addAll(_renderInfo(context, order));
///   return result;
/// }

 List<Widget> _renderInfo(BuildContext context, OrderDetailModel orderDetailModel){
   var result = List<Widget>();
   result.add(_sectionTitle(orderDetailModel.orderNo));
   result.add(_sectionText(orderDetailModel.address));
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

/// Widget _bannerImage(String url, double height){
///   return Container(
///       constraints: BoxConstraints.tightFor(height: height),
///       child: Image.network(url, fit: BoxFit.fitWidth)
///   );
/// }
///

class OrderInfo extends StatefulWidget {
  OrderInfo({Key key, this.authToken, this.iD}) : super(key: key);
  final String authToken;
  final int iD;

  @override
  _OrderInfoState createState() => _OrderInfoState();
}

class _OrderInfoState extends State<OrderInfo> {

  bool showLoading = true;

  String errorMessage;
  bool _isLoading = false;


  ///method
  final http.Client httpClient = http.Client();
 ///OrderDetailModel orderDetailModel;
  OrdersListModel ordersListModel;
  // ignore: missing_return
  Future<void> getInfo(int iD) async {
    final url = "https://softalogics.com/tailor/api/order-detail/$iD";
    final encodedUrl = Uri.encodeFull(url);
    final response = await httpClient.get(Uri.parse(encodedUrl), headers: {
      HttpHeaders.authorizationHeader: "Bearer ${widget.authToken}"
    });
    print("Response ========== ${response.body}");
    if (response.statusCode == 200) {
      ordersListModel = OrdersListModel.fromJson(json.decode(response.body));
      
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
    getInfo(widget.iD)
        .then((response) {
      setState(() {
        showLoading = false;
      });
    });
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
      body:showLoading
          ? Center(
        child: CupertinoActivityIndicator(),
      )
          : ListView.builder(
        itemCount: ordersListModel.orders?.length ?? 0,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.black,
              leading: Center(
                child: Text(ordersListModel.orders[index].orderNo).text.black.make(),
              ),
              title: Text(
                  ordersListModel.orders[index].address
              ),
            ),
          );
        },
      ),

        /// Container(height: 16),


    );
  }
}



