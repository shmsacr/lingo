import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingo/data/model/word_model.dart';
import 'package:lingo/data/services/local_storage.dart';

final wordListNotifierProvider =
    StateNotifierProvider<WordListNotifier, List<Words>>(
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

  Future<bool?> isData() async {
    final words = state;
    if (words.isEmpty) {
      return false;
    } else if (words.isNotEmpty) {
      return true;
    } else {
      return null;
    }
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
}
