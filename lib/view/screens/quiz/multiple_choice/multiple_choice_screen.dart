import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:lingo/controller/riverpod/multiple_choice_controller.dart';
import 'package:lingo/view/theme/app_colors.dart';
import 'package:lingo/view/widget/custom_text_widget.dart';

@immutable
final class MultipleChoiceScreen extends ConsumerStatefulWidget {
  const MultipleChoiceScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MultipleChoiceScreenState();
}

class _MultipleChoiceScreenState extends ConsumerState<MultipleChoiceScreen> {


  @override
  void initState() {
  
    super.initState();
       Future.microtask(() => ref.read(quizProvider.notifier).fetchAndLoading());
  }


  @override
  Widget build(BuildContext context) {
    final _quizWordProvider = ref.watch(quizProvider);
    final _quizproviderNotifier = ref.watch(quizProvider.notifier);

    bool _checkQuizCount() {
      if ((_quizWordProvider.questionCount ?? 1) >
          _quizproviderNotifier.allWordList.length) return true;
      return false;
    }

    return Scaffold(
      appBar: AppBar(
        leading: _AppBarLeadingIconButton(
            quizproviderNotifier: _quizproviderNotifier),
        centerTitle: true,
        title: Text('Çoktan Seçmeli Sorular'),
      ),
      body: _checkQuizCount()
          ? _CheckQuizEndAlertDialog(
              quizNotifier: _quizproviderNotifier,
            )
          : Padding(
              padding: context.padding.medium,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _QuestionWordTitle(quizWordProvider: _quizWordProvider),
                  SizedBox(
                    height: context.sized.dynamicHeight(0.05),
                  ),
                  ..._buildRadioListTile(_quizWordProvider.options ?? []),
                  SizedBox(
                    height: context.sized.dynamicHeight(0.05),
                  ),
                  TextButton(
                    onPressed: () {
                      ref.read(quizProvider.notifier).nextQuestion();
                    },
                    child: _quizWordProvider.questionCount ==
                            _quizproviderNotifier.allWordList.length
                        ? Icon(Icons.done)
                        : CustomTextWidget(text: 'Next Question'),
                  ),
                  CustomTextWidget(
                      text:
                          '${(_quizWordProvider.questionCount ?? 1)} / ${_quizproviderNotifier.allWordList.length}')
                ],
              ),
            ),
    );
  }

  List<Widget> _buildRadioListTile(List<String> options) {
    final selectedAnswer = ref.watch(quizProvider).selectedValue;
    final _currentQuestion = ref.watch(quizProvider).currentQuestion;

    return options.map((option) {
      Color cardColor = selectedAnswer == ""
          ? AppColors.darkTheme
          : option == _currentQuestion?['means']
              ? Colors.green.shade800
              : Colors.red.shade300;

      return Card(
        color: cardColor,
        elevation: 4,
        child: RadioListTile(
          fillColor: MaterialStatePropertyAll<Color>(Colors.white),
          value: option,
          title: CustomTextWidget(
            text: option,
            color: Colors.white,
            fontsize: context.general.textTheme.headlineMedium?.fontSize,
          ),
          groupValue: selectedAnswer,
          onChanged: selectedAnswer != ""
              ? null
              : (value) {
                  ref
                      .read(quizProvider.notifier)
                      .selectedAnswer(value.toString());
                  ref.read(quizProvider.notifier).checkAnswer(value.toString());
                },
        ),
      );
    }).toList();
  }
}

final class _CheckQuizEndAlertDialog extends StatelessWidget {
  const _CheckQuizEndAlertDialog({
    required QuizNotifier quizNotifier,
  }) : _quizNotifier = quizNotifier;

  final QuizNotifier _quizNotifier;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        elevation: 2,
        title: Text('Quiz Sonuçları'),
        content: ListTile(
            title: CustomTextWidget(
              text: 'Doğru Cevap:   ${_quizNotifier.correctAnswerCount} ',
              color: Colors.black,
            ),
            subtitle: CustomTextWidget(
              text:
                  'Yanlış Cevap:   ${(_quizNotifier.questionCount - 1) - _quizNotifier.correctAnswerCount}',
              color: Colors.black,
            )),
        actions: [
          TextButton(
            onPressed: () {
              _quizNotifier.resetQuiz();
              Navigator.pop(context);
            },
            child: Text('Quiz Sayfasına Dön'),
          ),
        ],
      ),
    );
  }
}

final class _AppBarLeadingIconButton extends StatelessWidget {
  const _AppBarLeadingIconButton({
    required QuizNotifier quizproviderNotifier,
  }) : _quizprovider = quizproviderNotifier;

  final QuizNotifier _quizprovider;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _quizprovider.resetQuiz();

        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }
}

final class _QuestionWordTitle extends StatelessWidget {
  const _QuestionWordTitle({
    required QuizState quizWordProvider,
  }) : _quizWordProvider = quizWordProvider;

  final QuizState _quizWordProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      width: context.general.mediaQuery.size.width * 0.8,
      height: 70,
      child: Card(
        color: AppColors.darkTheme,
        child: Center(
          child: CustomTextWidget(
            text: _quizWordProvider.currentQuestion?['word']?.toUpperCase() ??
                'soru gelmedi',
            fontsize: context.general.textTheme.headlineMedium?.fontSize,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
