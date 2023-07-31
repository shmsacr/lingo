import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingo/data/model/word_model.dart';

import 'db_controller.dart';

final randomWordProvider = FutureProvider<Words>((ref) async {
  final wordList = await ref.read(wordsProvider.future);
  final randomIndex = Random().nextInt(wordList.length);

  print(randomIndex);
  return wordList[randomIndex];
});

final fillColorProvider = StateProvider<Color>((ref) => Colors.blueGrey);
final randomIndexProvider = StateProvider<int>((ref) => Random().nextInt(1));
