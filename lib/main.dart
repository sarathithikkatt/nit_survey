import 'package:flutter/material.dart';
import 'package:survey_app/glabal.dart';
import 'package:survey_app/Screens/home.dart';
import 'package:survey_app/Screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: islogged ? HomePage() : LoginPage(),
    );
  }
}
