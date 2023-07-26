import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lingo/data/model/word_model.dart';
import 'package:lingo/data/services/local_storage.dart';

final wordListNotifierProvider =
    StateNotifierProvider.autoDispose<WordListNotifier, List<Words>>(
  (ref) => WordListNotifier(),
);

class WordListNotifier extends StateNotifier<List<Words>> {
  WordListNotifier() : super([]) {
    getAllWords();
  }

  Future<List<Words>> getAllWords() async {
    final localStorage = HiveLocalStroge();
    final words = await localStorage.getAllWords();
    state = words;
    return state;
  }

  Future<void> addWord(Words word) async {
    final localStorage = HiveLocalStroge();
    await localStorage.addWord(word: word);
    await getAllWords();
  }

  Future<void> deleteWord(Words word) async {
    final localStorage = HiveLocalStroge();
    final success = await localStorage.deleteWord(word: word);
    if (success) {
      state = state.where((w) => w.id != word.id).toList();
    }
  }

  void speak(String text) async {
    final sountTTS = FlutterTts();
    await sountTTS.setLanguage("en-US");
    await sountTTS.setPitch(1);
    await sountTTS.speak(text);
  }
}
