import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'model/model-class.dart';
import 'package:http/http.dart' as http;

class NetworkRequest{
  static const String url = 'https://jsonplaceholder.typicode.com/photos';

  static List<Home> parseHome(String responseBody){
    var list = json.decode(responseBody) as List<dynamic>;
    List<Home> home = list.map((model) => Home.fromJson(model)).toList();
    return home;
  }

  static Future<List<Home>>fetchHome() async {
    final response =
    await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return compute(parseHome, response.body);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}