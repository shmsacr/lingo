import 'package:flutter_tts/flutter_tts.dart';

void speak(String text) async {
  final sountTTS = FlutterTts();
  await sountTTS.setLanguage("en-US");
  await sountTTS.setPitch(1);
  await sountTTS.speak(text);
}
