import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tailor_app/models/ApiResponse.dart';
import 'package:tailor_app/models/OrdersDetailModel.dart';
import 'styles.dart';
import 'model/model-allorders.dart';
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

/// List<Widget> _renderInfo(BuildContext context, Order order){
///   var result = List<Widget>();
///   result.add(_sectionTitle(order.title));
///   result.add(_sectionText(order.description));
///   return result;
/// }

/// Widget _sectionTitle(String text){
///   return Container(
///       padding: EdgeInsets.fromLTRB(25.0,25.0,25.0,10.0),
///       child: Text(text,
///           textAlign: TextAlign.left,
///           style: Styles.headerLarge));
/// }
/// Widget _sectionText(String text){
///   return Container(
///       padding: EdgeInsets.fromLTRB(25.0,15.0,25.0,15.0),
///       child:Text(text, style: Styles.textDefault,)
///   );
/// }

/// Widget _bannerImage(String url, double height){
///   return Container(
///       constraints: BoxConstraints.tightFor(height: height),
///       child: Image.network(url, fit: BoxFit.fitWidth)
///   );
/// }
///

class OrderInfo extends StatefulWidget {
  OrderInfo({Key key, this.authToken, this.Id}) : super(key: key);
  final String authToken;
  final int Id;

  @override
  _OrderInfoState createState() => _OrderInfoState();
}

class _OrderInfoState extends State<OrderInfo> {

  bool showLoading = true;

  String errorMessage;
  bool _isLoading = false;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();

    setState(() {
      _isLoading = true;
    });
    getInfo(widget.Id)
        .then((response) {
      setState(() {
        _isLoading = false;
      });

      if (response.error) {
        errorMessage = response.errorMessage ?? 'An error occurred';
      }
      orderDetailModel = response.data;
      _titleController.text = orderDetailModel.noteTitle;
      _contentController.text = orderDetailModel.noteContent;
    });
  }

  ///method
  final http.Client httpClient = http.Client();
  OrderDetailModel orderDetailModel;
  // ignore: missing_return
  Future<APIResponse<OrderDetailModel>> getInfo(int Id) async {
    final url = "https://softalogics.com/tailor/api/order-detail/ Id";
    final encodedUrl = Uri.encodeFull(url);
    final response = await httpClient.get(Uri.parse(encodedUrl), headers: {
      HttpHeaders.authorizationHeader: "Bearer ${widget.authToken}"
    });
    print("Response ========== ${response.body}");
    if (response.statusCode == 200) {
      orderDetailModel = OrderDetailModel.fromJson(json.decode(response.body));
      
     ///print("Order List ====== ${orderDetailModel.order.length}");
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: _isLoading ? Center(child: CircularProgressIndicator()) : Column(
          children: <Widget>[
            Text(_titleController.text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),

            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                  hintText: 'Order title',
                border: InputBorder.none,
              ),
            ),

            Container(height: 8),

            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                  hintText: 'Order content',
                border: InputBorder.none,
              ),
            ),

            Container(height: 16),

          ],
        ),
      ),
    );
  }
}
