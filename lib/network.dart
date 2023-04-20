import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  static var data;
  static Future getprediction(
      List<String> char, List<double> x, List<double> y, List<double> z) async {
    print("object");
    List bodydata = [];
    for (int i = 0; i < char.length; i++) {
      Map entry = {
        "character": char[i],
        'X': x[i],
        'Y': y[i],
        'Z': z[i],
        'H': 0.0837,
        "DD": 0.6212,
        "UD": 0.5375,
        "S": 2
      };
      bodydata.add(entry);
    }
    print(bodydata);
    var response = await http.post(
        Uri(
          scheme: 'http',
          host: '192.168.15.222',
          port: 5000,
          path: 'predict',
        ),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{'input': bodydata}));
    print(response.statusCode);
    //data = jsonDecode(response.body);
    //print("dta" + data.toString());
    return response.body;
  }
}
