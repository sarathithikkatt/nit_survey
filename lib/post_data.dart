import 'dart:convert';

import 'package:http/http.dart' as http;

sendData(String userName) {
  http
      .post(
        Uri.parse('https://script.google.com/macros/s/AKfycbytANo71KlTicCw8GYNRlAupacnDQN4TGGDp7zKVV0QDm0mdv3S/exec'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'userName': 'flutter Sonu', 'userId': 'flutterFromSonu'}),
      )
      .then((res) => print(res.body));
}
