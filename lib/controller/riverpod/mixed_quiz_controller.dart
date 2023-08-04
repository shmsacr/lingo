import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingo/view/screens/quiz/multiple_choice/multiple_choice_screen.dart';
import 'package:lingo/view/screens/writing_exercises/writing_exercises_screen.dart';

final mixedQuizProvider =
    StateNotifierProvider<MixedQuizNotifier, List<Widget>>((ref) {
  return MixedQuizNotifier();
});

class MixedQuizNotifier extends StateNotifier<List<Widget>> {
  MixedQuizNotifier() : super([]);

  final List<Widget> multipleChoiceQuestions = [
    MultipleChoiceScreen(),
  ];
  final List<Widget> trueFalseQuestions = [
    WritingExercisesScreen(),
  ];
  List<Widget> mixedQuestions = [];

  Random random = Random();

  List<Widget> mixedToQuiz() {
    mixedQuestions.addAll(multipleChoiceQuestions);
    mixedQuestions.addAll(trueFalseQuestions);
    random.nextInt(3);
    mixedQuestions.shuffle(random);
    state = mixedQuestions;
    return state;
  }
}
