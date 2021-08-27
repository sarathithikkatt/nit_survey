// Flutter code sample for LogicalKeyboardKey
//
// This example shows how to detect if the user has selected the logical "Q"
// key.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_app/post_data.dart';

/// This is the stateful widget that the main application instantiates.
class LogicalKeyboard extends StatefulWidget {
  const LogicalKeyboard({Key? key}) : super(key: key);

  @override
  State<LogicalKeyboard> createState() => _LogicalKeyboardState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _LogicalKeyboardState extends State<LogicalKeyboard> {
// The node used to request the keyboard focus.
  final FocusNode _focusNode = FocusNode();
// The message to display.
  String? _message;

// Focus nodes need to be disposed.
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

// Handles the key events from the RawKeyboardListener and update the
// _message.
  void _handleKeyEvent(RawKeyEvent event) {
    setState(() {
      if (event.logicalKey == LogicalKeyboardKey.keyQ) {
        _message = 'Pressed the "Q" key!';
      } else {
        if (kReleaseMode) {
          _message = 'Not a Q: Pressed 0x${event.logicalKey.keyId.toRadixString(16)}';
        } else {
          // The debugName will only print useful information in debug mode.
          _message = 'Not a Q: Pressed ${event.logicalKey.debugName}';
          print(_message);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: Center(
      child: TextButton(
        child: Text('submit'),
        onPressed: () {
          sendData('sonuSimon');
        },
      ),
    )
        // Container(
        //   color: Colors.white,
        //   alignment: Alignment.center,
        //   child: DefaultTextStyle(
        //     style: textTheme.headline4!,
        //     child: RawKeyboardListener(autofocus: true, focusNode: _focusNode, onKey: _handleKeyEvent, child: TextField()),
        //   ),
        // ),
        );
  }
}
