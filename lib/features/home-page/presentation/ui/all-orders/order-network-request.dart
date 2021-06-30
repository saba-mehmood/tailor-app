import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'model/model-allorders.dart';

class OrderNetworkRequest{
  static const String url = 'https://jsonplaceholder.typicode.com/photos';

  static List<Order> parseOrder(String responseBody){
    var list = json.decode(responseBody) as List<dynamic>;
    List<Order> order = list.map((model) => Order.fromJson(model)).toList();
    return order;
  }

  static Future<List<Order>>fetchOrder() async {
    final response =
    await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return compute(parseOrder, response.body);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}