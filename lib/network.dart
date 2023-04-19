import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  static var data;
  static Future getprediction() async {
    print("object");
    var response = await http.get(Uri(
        scheme: 'http',
        host: '10.0.2.2',
        port: 5000,
        path: 'predict',
        queryParameters: {'': ''}));
    data = jsonDecode(response.body);
    print(data);
    return await data;
  }
}
