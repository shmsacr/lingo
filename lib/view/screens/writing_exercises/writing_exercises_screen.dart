import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controller/writing_exercise_controller.dart';

class WritingExercisesScreen extends ConsumerWidget {
  const WritingExercisesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = ref.watch(userTextProvider.notifier);
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
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: fillerColor.state,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            )),
                        onChanged: (value) {
                          String text =
                              randomIndex.state == 0 ? data.word : data.means;
                          print("$text - $value");
                          if (value == text) {
                            ref.refresh(fillColorProvider.notifier).state =
                                Colors.greenAccent;
                          } else {
                            ref.refresh(fillColorProvider.notifier).state =
                                Colors.redAccent;
                          }
                        },
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          ref.refresh(randomWordProvider);
                          ref.refresh(randomIndexProvider);
                          fillerColor.state = Colors.blue.shade100;

                          print(randomIndex.state);
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
