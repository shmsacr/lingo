import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingo/controller/riverpod/words_controller.dart';
import 'package:lingo/data/model/true_false_model.dart';

import '../../data/model/word_model.dart';

final trueFalseProvider =
    StateNotifierProvider<TrueFalseNotifier, List<TrueFalse>>((ref) {
  final allWords = ref.watch(wordListNotifierProvider);
  return TrueFalseNotifier(allWord: allWords);
});

class TrueFalseNotifier extends StateNotifier<List<TrueFalse>> {
  TrueFalseNotifier({required this.allWord}) : super([]) {
    trueFalseList();
  }

  List<Words> allWord;

  Future<void> trueFalseList() async {
    int randomIndex = Random().nextInt(allWord.length + 1);
    int randomIndex1 = Random().nextInt(2);
    if (randomIndex1 == 1) {
      TrueFalse trueFalse = TrueFalse(
          word: allWord[randomIndex].word,
          means: allWord[randomIndex].means,
          result: true);
      print(trueFalse.means);
      state = [trueFalse];
    } else {
      int randomIndex3;
      do {
        randomIndex3 = Random().nextInt(allWord.length + 1);
      } while (randomIndex == randomIndex3);
      TrueFalse trueFalse = TrueFalse(
          word: allWord[randomIndex].word,
          means: allWord[randomIndex3].means,
          result: false);
      print(trueFalse.means);
      state = [trueFalse];
    }
  }
}
