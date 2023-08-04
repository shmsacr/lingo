import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingo/controller/riverpod/words_controller.dart';
import 'package:lingo/core/const/string_const.dart';
import 'package:lingo/core/enums/image_enums.dart';
import 'package:lingo/data/model/word_model.dart';
import 'package:lingo/view/screens/quiz/quiz_Screen.dart';

import '../../../theme/app_colors.dart';

mixin QuizScreenMixin {
  List<Widget> getCards() {
    return _quizScreenItem
        .map((data) => PracticalCard(
              text: data['text'].toString(),
              subtitle: data['subtitle'].toString(),
              imageURL: data['imageURL'].toString(),
              textCardColor: data['textCardColor'] as Color,
            ))
        .toList();
  }
}

void pushToSelectScreenQuiz(BuildContext context, int index, WidgetRef ref) {
  final List<Words>? _allWord = ref.read(wordListNotifierProvider);

  switch (index) {
    case 0:
      (_allWord?.length ?? 0) < 5
          ? {
              ScaffoldMessenger.of(context).clearSnackBars(),
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 2),
                  content: Text(
                      "5 kelime öğrenmeden test çözemezsiniz. ${_allWord!.length} tane kelime öğrendiniz"),
                ),
              )
            }
          : Navigator.pushNamed(context, '/multipleChoice');
      break;
    case 1:
      Navigator.pushNamed(context, '/mixedQuiz');
      break;
    case 2:
      Navigator.pushNamed(context, '/writePage');
      break;
    case 3:
      Navigator.pushNamed(context, '/denemePage');
      break;
  }
}

List<Map<String, dynamic>> _quizScreenItem = [
  /// çoktan seçmeli
  {
    'text': StringConst.multipleChoice,
    'subtitle': StringConst.multipleChoice,
    'imageURL': ImageEnum.choose.toPng,
    'textCardColor': AppColors.green,
  },

  /// true false
  {
    'text': StringConst.trueAndFalse,
    'subtitle': StringConst.trueAndFalse,
    'imageURL': ImageEnum.trueFalse.toPng,
    'textCardColor': AppColors.red,
  },

  /// kelime yazma
  {
    'text': StringConst.writingPractice,
    'subtitle': StringConst.writingPractice,
    'imageURL': ImageEnum.creativeWriting.toPng,
    'textCardColor': AppColors.blue,
  },

  /// karışık
  {
    'text': StringConst.mixedPractice,
    'subtitle': StringConst.mixedPractice,
    'imageURL': ImageEnum.quiz.toPng,
    'textCardColor': AppColors.purple,
  },
];
