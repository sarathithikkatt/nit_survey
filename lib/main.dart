import 'package:flutter/material.dart';
import 'package:survey_app/logicalKeyboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogicalKeyboard(),
    );
  }
}
