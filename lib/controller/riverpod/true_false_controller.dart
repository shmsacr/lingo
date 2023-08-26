import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingo/data/model/true_false_model.dart';
import 'package:lingo/view/theme/app_colors.dart';

import '../../../controller/riverpod/db_controller.dart';

final trueFalseProvider = FutureProvider<TrueFalse>((ref) async {
  final allWord = ref.watch(wordsProvider);

  int randomIndex = Random().nextInt(allWord.value!.length);

  print(randomIndex);

  int randomIndex1 = Random().nextInt(2);

  print(randomIndex1);

  if (randomIndex1 == 1) {
    TrueFalse trueFalse = await TrueFalse(
        word: allWord.value![randomIndex].word,
        means: [allWord.value![randomIndex].means],
        result: true);
    print(trueFalse.means);
    return trueFalse;
  } else {
    int randomIndex3;
    do {
      randomIndex3 = await Random().nextInt(allWord.value!.length);
    } while (randomIndex == randomIndex3);

    TrueFalse trueFalse = await TrueFalse(
        word: allWord.value![randomIndex].word,
        means: [
          allWord.value![randomIndex3].means,
          allWord.value![randomIndex].means
        ],
        result: false);
    print(trueFalse.means);
    return trueFalse;
  }
});

final cardColorProvider = StateProvider<Color>((ref) {
  return Colors.white;
});

final textColorProvider = StateProvider((ref) => AppColors.appGeneralDarkGrey);

final scoreProvider = StateProvider<int>((ref) => 0);
final startStopProivder = StateProvider<bool>((ref) => false);
final answerListProvider = StateProvider<bool>((ref) => false);
