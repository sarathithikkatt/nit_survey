import 'package:flutter_emoji/flutter_emoji.dart';

int countEmoji(String string) {
  EmojiParser emojiParser = EmojiParser();
  int count = 0;

  String unemoji = emojiParser.unemojify(string);
  for (int i = 0; i < unemoji.length; i++) if (unemoji[i] == ':') count++;
  // print(count ~/ 2);
  return count ~/ 2;
}

String calcDuration(DateTime start, DateTime end) {
  // String duration = DateTime.now().difference(DateTime(year)).toString();
  return duration;
}
