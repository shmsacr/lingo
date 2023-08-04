import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingo/controller/riverpod/mixed_quiz_controller.dart';
import 'package:lingo/controller/riverpod/words_controller.dart';

class MixedQuiz extends ConsumerStatefulWidget {
  const MixedQuiz({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MixedQuizState();
}

class _MixedQuizState extends ConsumerState<MixedQuiz> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(mixedQuizProvider.notifier).mixedToQuiz());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ref.read(mixedQuizProvider.notifier).mixedQuestions[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_currentIndex < ref.read(wordListNotifierProvider).length) {
              _currentIndex++;
            }
          });
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
