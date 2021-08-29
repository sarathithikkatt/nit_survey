import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:survey_app/Screens/activity.dart';

import 'package:survey_app/global.dart';
import 'package:survey_app/Screens/home.dart';
import 'package:survey_app/Screens/login.dart';
import 'package:survey_app/logicalKeyboard.dart';
import 'package:survey_app/youtube.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Youtube()
        // islogged ? HomePage() : LoginPage(),
        );
  }
}
