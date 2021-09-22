// Flutter code sample for LogicalKeyboardKey
//
// This example shows how to detect if the user has selected the logical "Q"
// key.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:survey_app/functions.dart';
import 'package:survey_app/global.dart';
import 'package:survey_app/post_data.dart';

class LogicalKeyboard extends StatefulWidget {
  const LogicalKeyboard({Key? key}) : super(key: key);

  @override
  State<LogicalKeyboard> createState() => _LogicalKeyboardState();
}

class _LogicalKeyboardState extends State<LogicalKeyboard> {
  int bsCount = 0, strlen = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          TextButton(
            child: Text('submit'),
            onPressed: () {
              sendData('sonuSimon');
            },
          ),
          TextField(
            onChanged: (value) {
              // print('cheking: ${value.length}  < $strlen');
              session_text_length = value.length;
              session_emoji_count = countEmoji(value);
              if (value.length < strlen) {
                setState(() {
                  bsCount = bsCount + 1;
                  session_backspace_count = bsCount;
                  print('backspace : $bsCount');
                });
              }

              strlen = value.length;
              // print('onComplete: ${value.length}  < $strlen');
            },
          ),
          SizedBox(
            height: 20,
          ),
          Text("Backspace count: ${(bsCount)}")
        ],
      )),
    );
  }
}
