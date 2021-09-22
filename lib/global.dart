import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

bool islogged = false;
String chosenValue = activities[0];
List<String> activities = <String>[
  'Running',
  'Walk',
  'Swimming',
];

int session_emoji_count = 0;
int session_backspace_count = 0;
int session_text_length = 0;
