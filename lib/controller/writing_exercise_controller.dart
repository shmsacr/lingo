import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingo/data/model/word_model.dart';

import 'db_controller.dart';

final userInputProvider = StateProvider<String>((ref) => '');

final randomWordProvider = FutureProvider<Words>((ref) async {
  final wordList = await ref.read(wordsProvider.future);
  final randomIndex = Random().nextInt(wordList.length);

  print(randomIndex);
  return wordList[randomIndex];
});

final fillColorProvider =
    StateProvider.autoDispose<Color>((ref) => Colors.blue.shade100);
final randomIndexProvider =
    StateProvider.autoDispose<int>((ref) => Random().nextInt(1));

final userTextProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
