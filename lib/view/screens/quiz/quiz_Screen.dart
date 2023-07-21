import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingo/core/const/string_const.dart';
import 'package:kartal/kartal.dart';
import 'package:lingo/view/widget/custom_text_widget.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: context.padding.normal,
        child: Column(
          children: [
            const CustomTextWidget(text: StringConst.quizAppName),
          ],
        ),
      ),
    );
  }
}
