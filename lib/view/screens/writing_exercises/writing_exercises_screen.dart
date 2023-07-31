import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controller/writing_exercise_controller.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myController.addListener(changeColor);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myController.dispose();
    super.dispose();
  }

  void changeColor() {
    final randomWord = ref.watch(randomWordProvider);
    final randomIndex = ref.watch(randomIndexProvider.notifier);

    String text = randomIndex.state == 0
        ? randomWord.value!.word
        : randomWord.value!.means;
    print("${myController.text} -- $text");
    print(text);
    if (myController.text.isEmpty) {
      ref.watch(fillColorProvider.notifier).state = Colors.blueGrey;
    } else if (myController.text.toLowerCase() == text.toLowerCase()) {
      ref.refresh(fillColorProvider.notifier).state = Colors.greenAccent;
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
            data: (data) => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Anlamını yazın:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Text(
                        randomIndex.state == 0 ? data.means : data.word,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: myController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: fillerColor.state,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            )),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          randomIndex.state = Random().nextInt(2);
                          print(randomIndex.state);
                          ref.refresh(randomWordProvider);

                          myController.clear();

                          // Cevap kontrolü ve sonraki kelimeye geçiş işlemleri burada yapılabilir.
                        },
                        child: Text('Sonraki Kelime'),
                      ),
                    ],
                  ),
                ),
            error: (error, _) => Text(error.toString()),
            loading: () => CircularProgressIndicator()));
  }
}
