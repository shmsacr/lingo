
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lingo/data/model/word_model.dart';
import 'package:lingo/data/services/local_storage.dart';

final wordListNotifier = StateNotifierProvider<WordListNotifier, WordListState>(
  (ref) => WordListNotifier(),
);



 class WordListNotifier extends StateNotifier<WordListState> {
  WordListNotifier() : super(WordListState(words: []));

  List<Words>? _allWords = [];
  bool isLoading = false;
  List<Words>? get allWords => _allWords;

  final localStorage = HiveLocalStroge();

  Future<void> fetchAndLoading() async {
    state = state.copyWith(isLoading: true);
    await getAllWords();
    state = state.copyWith(isLoading: false);
  }

  Future<List<Words>> getAllWords() async {
    final words = await localStorage.getAllWords();

    if (words.isNotEmpty) {
      _allWords = words;
    } else {
      return [];
    }

    state = state.copyWith(words: words);
    return words;
  }

  void addWord(Words word) async {
    await localStorage.addWord(word: word);
    _allWords?.add(word);
    state = state.copyWith(words: _allWords);
  }

  void deleteWord(Words word) async {
    await localStorage.deleteWord(word: word);
    _allWords?.remove(word);
    state = state.copyWith(words: _allWords);
  }
}

class WordListState {
  final List<Words>? words;
  final bool? isLoading;

  WordListState({
    this.words,
    this.isLoading,
  });

  WordListState copyWith({
    List<Words>? words,
    bool? isLoading,
  }) {
    return WordListState(
      words: words ?? this.words,
      isLoading: isLoading,
    );
  }
}
