import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:lingo/view/theme/app_colors.dart';
import 'package:lingo/view/widget/custom_text_widget.dart';

import '../../../controller/riverpod/writing_exercise_controller.dart';

class WritingExercisesScreen extends ConsumerStatefulWidget {
  const WritingExercisesScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _WritingExercisesScreenState();
}

class _WritingExercisesScreenState
    extends ConsumerState<WritingExercisesScreen> {
  final myController = TextEditingController();
  String? text;
  @override
  void initState() {
    super.initState();
    myController.addListener(changeColor);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void changeColor() {
    final randomWord = ref.watch(randomWordProvider);
    final randomIndex = ref.watch(randomIndexProvider.notifier);

    text = randomIndex.state == 0
        ? randomWord.value!.word
        : randomWord.value!.means;
    print("${myController.text} -- $text");
    print(text);
    if (myController.text.isEmpty) {
      ref.watch(fillColorProvider.notifier).state =
          AppColors.appGeneralDarkGrey;
    } else if (myController.text.toLowerCase() == text?.toLowerCase()) {
      ref.refresh(fillColorProvider.notifier).state = Colors.green;
    } else {
      ref.refresh(fillColorProvider.notifier).state = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final randomWord = ref.watch(randomWordProvider);
    final fillerColor = ref.watch(fillColorProvider.notifier);
    final randomIndex = ref.watch(randomIndexProvider.notifier);
    return Scaffold(
        appBar: AppBar(
          title: Text('Kelime Egzersizi'),
        ),
        body: randomWord.when(
            data: (data) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 400,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomTextWidget(
                                  text: randomIndex.state == 0
                                      ? data.means
                                      : data.word,
                                  fontsize: context.general.textTheme
                                      .headlineMedium?.fontSize,
                                  color: AppColors.appGeneralDarkGrey),
                              Divider(
                                color: Colors.black,
                                endIndent: 30,
                                indent: 30,
                              ),
                              SizedBox(height: 16),
                              TextField(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                                enabled: myController.text.toLowerCase() ==
                                        text?.toLowerCase()
                                    ? false
                                    : true,
                                controller: myController,
                                decoration: InputDecoration(
                                  hintText: 'Kelimeyi buraya yazınız',
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                  suffixIcon: myController.text.toLowerCase() ==
                                          text?.toLowerCase()
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        )
                                      : null,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: fillerColor.state, width: 1),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: fillerColor.state, width: 1),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: fillerColor.state, width: 1),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              TextButton(
                                onPressed: () {
                                  randomIndex.state = Random().nextInt(2);
                                  print(randomIndex.state);
                                  ref.invalidate(randomWordProvider);
                                  myController.clear();

                                },
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: CustomTextWidget(
                                  text: 'Sonraki Kelime',
                                  color: AppColors.appGeneralDarkGrey,
                                  fontsize: context
                                      .general.textTheme.titleMedium?.fontSize,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            error: (error, _) => Text(error.toString()),
            loading: () => CircularProgressIndicator()));
  }
}
