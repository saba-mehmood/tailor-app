import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tailor_app/features/home-page/presentation/ui/widgets/drawer-menu.dart';
import 'package:tailor_app/models/AllOrdersModel.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key key, this.authToken}) : super(key: key);
  final String authToken;

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool showLoading = true;

  final http.Client httpClient = http.Client();
  OrdersListModel ordersListModel;
  Future<void> getData() async {
    final url = "https://softalogics.com/tailor/api/orders";
    final encodedUrl = Uri.encodeFull(url);
    final response = await httpClient.get(Uri.parse(encodedUrl), headers: {
      HttpHeaders.authorizationHeader: "Bearer ${widget.authToken}"
    });
    print("Response ========== ${response.body}");
    if (response.statusCode == 200) {
      ordersListModel = OrdersListModel.fromJson(json.decode(response.body));
      print("Order List ====== ${ordersListModel.orders.length}");
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
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFB19069),
        title: Padding(
          padding: const EdgeInsets.only(right: 90),
          child: Text('All Orders').text.uppercase.size(20).bold.white.make(),
        ),
      ),
      drawer: DrawerScreen(
        authToken: widget.authToken,
      ),
      backgroundColor: Color(0xFFedeeef),
      body: showLoading
          ? Center(
              child: CupertinoActivityIndicator(),
            )
          : ListView.builder(
              itemCount: ordersListModel.orders?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.white,
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFFB19069),
                      child: Center(
                        child: Text("$index"),
                      ),
                    ),
                    title: Text(
                      ordersListModel.orders[index].customer.name,
                    ),
                    subtitle: Text(
                      ordersListModel.orders[index].address,
                    ),
                    trailing: Text(
                      ordersListModel.orders[index].orderNo,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
