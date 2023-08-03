import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../controller/riverpod/true_false_controller.dart';

class TrueFalseScreen extends ConsumerStatefulWidget {
  const TrueFalseScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _TrueFalseScreenState();
}

class _TrueFalseScreenState extends ConsumerState<TrueFalseScreen> {
  List<Icon> scoreKeeper = [];
  void checkAnwer(bool userChoice, bool result) {
    if (userChoice == result) {
      scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
      print("Dogru yapıldı");
    } else {
      scoreKeeper.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );

      print("yanlıs cevap");
    }
    ref.refresh(trueFalseProvider);
  }

  @override
  Widget build(BuildContext context) {
    final trueFalseWord = ref.watch(trueFalseProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text("True/False Quiz"),
        ),
        body: trueFalseWord.when(
            data: (data) => SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                data.word + " = " + data.means,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Wrap(children: scoreKeeper),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.green),
                              ),
                              onPressed: () {
                                checkAnwer(true, data.result);
                              },
                              child: Text(
                                'True',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.red),
                              ),
                              onPressed: () {
                                checkAnwer(false, data.result);
                              },
                              child: Text(
                                'False',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            error: (error, _) => Text(error.toString()),
            loading: () => CircularProgressIndicator()));
  }
}
