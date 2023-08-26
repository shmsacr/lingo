import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:lingo/controller/riverpod/time_controller.dart';
import 'package:lingo/data/model/true_false_model.dart';
import 'package:lingo/view/widget/custom_text_widget.dart';

import '../../../../controller/riverpod/timer_controller.dart';
import '../../../../controller/riverpod/true_false_controller.dart';

class TrueFalseScreen extends ConsumerStatefulWidget {
  const TrueFalseScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _TrueFalseScreenState();
}

class _TrueFalseScreenState extends ConsumerState<TrueFalseScreen> {
  @override
  void initState() {
    super.initState();
  }

  String _formatDuration(Duration duration) {
    return '${duration.inMinutes} : ${(duration.inSeconds % 60).toString().padLeft(2, '0')}s ${(duration.inMilliseconds % 1000 ~/ 10).toString().padLeft(2, '0')}';
  }

  List<Icon> scoreKeeper = [];

  bool isLoading = true;
  List<TrueFalse> answerList = [];

  Future<void> checkAnwer(bool userChoice, TrueFalse data) async {
    isLoading = false;
    if (userChoice == data.result) {
      ref.refresh(cardColorProvider.notifier).state = Colors.green;
      ref.refresh(textColorProvider.notifier).state = Colors.white;
      ref.read(scoreProvider.notifier).state++;
      data.result = true;
      answerList.add(data);
      print("Dogru yapıldı");
    } else {
      ref.refresh(cardColorProvider.notifier).state = Colors.red;
      ref.refresh(textColorProvider.notifier).state = Colors.white;
      data.result = false;
      answerList.add(data);
      print("yanlıs cevap");
    }

    Future.delayed(Duration(seconds: 1), () {
      ref.invalidate(trueFalseProvider);
      ref.refresh(cardColorProvider.notifier).state = Colors.white;
      ref.refresh(textColorProvider.notifier).state;
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final trueFalseWord = ref.watch(trueFalseProvider);
    final cardColor = ref.watch(cardColorProvider.notifier);
    final textColor = ref.watch(textColorProvider.notifier);
    final score = ref.watch(scoreProvider.notifier);
   // final timerValue = ref.watch(timerProvider);
    final stopwatchValue = ref.watch(stopwatchProvider);
    final formattedValue = _formatDuration(stopwatchValue);
    final startStop = ref.watch(startStopProivder);

    return WillPopScope(
      onWillPop: () async {
        ref.read(stopwatchProvider.notifier).reset();
        ref.invalidate(trueFalseProvider);
        ref.invalidate(scoreProvider);
        ref.invalidate(startStopProivder);
        ref.invalidate(answerListProvider);
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              formattedValue,
              style: TextStyle(fontSize: 40),
            ),
            actions: [
              IconButton(
                  onPressed: () async {
                    ref.watch(startStopProivder.notifier).state = !startStop;
                    if (ref.watch(startStopProivder)) {
                      ref.read(stopwatchProvider.notifier).start();
                    } else
                      ref.read(stopwatchProvider.notifier).stop();
                  },
                  icon: Icon(ref.watch(startStopProivder)
                      ? Icons.pause
                      : Icons.not_started_outlined))
            ],
          ),
          body: ref.watch(answerListProvider)
              ? ListView.builder(
                  itemCount: answerList.length,
                  itemBuilder: (context, index) {
                    TrueFalse data = answerList[index];
                    return ListTile(
                      title: CustomTextWidget(
                        text: data.word + " = " + data.means[0],
                        fontsize:
                            context.general.textTheme.headlineMedium?.fontSize,
                        color: textColor.state,
                      ),
                    );
                  })
              : trueFalseWord.when(
                  data: (data) => SafeArea(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: context.general.mediaQuery.size.height *
                                    0.3,
                                child: Card(
                                  color: cardColor.state,
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height:
                                              context.sized.dynamicHeight(0.1),
                                        ),
                                        Center(
                                          child: CustomTextWidget(
                                            text: data.word +
                                                " = " +
                                                data.means[0],
                                            fontsize: context.general.textTheme
                                                .headlineMedium?.fontSize,
                                            color: textColor.state,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      isLoading && startStop
                                          ? checkAnwer(false, data)
                                          : null;
                                    },
                                    icon: Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.red,
                                      size: 50,
                                    ),
                                  ),
                                  CustomTextWidget(
                                    text: "Score: ${score.state}",
                                    color: Colors.white,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      isLoading && startStop
                                          ? checkAnwer(true, data)
                                          : null;
                                    },
                                    icon: Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 50,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: context.padding.high,
                                child: ElevatedButton(
                                    onPressed: () {
                                      ref
                                          .read(stopwatchProvider.notifier)
                                          .stop();
                                      ref
                                          .watch(startStopProivder.notifier)
                                          .state = !startStop;
                                      _showAlertDialog(!startStop);
                                    },
                                    child: Text("Finish Quiz")),
                              )
                            ],
                          ),
                        ),
                      ),
                  error: (error, _) => Text(error.toString()),
                  loading: () => CircularProgressIndicator())),
    );
  }

  Future<void> _showAlertDialog(bool startStop) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cancel booking'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure want to cancel booking?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
                ref.read(stopwatchProvider.notifier).start();
                ref.watch(startStopProivder.notifier).state = !startStop;
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                ref.read(answerListProvider.notifier).state = true;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

//  Wrap(children: scoreKeeper),
// Expanded(
//   child: Padding(
//     padding: const EdgeInsets.all(15.0),
//     child: TextButton(
//       style: ButtonStyle(
//         backgroundColor:
//             MaterialStatePropertyAll(Colors.green),
//       ),
//       onPressed: () {
//         checkAnwer(true, data.result);
//       },
//       child: Text(
//         'True',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 24.0,
//         ),
//       ),
//     ),
//   ),
// ),
// Expanded(
//   child: Padding(
//     padding: const EdgeInsets.all(15.0),
//     child: TextButton(
//       style: ButtonStyle(
//         backgroundColor:
//             MaterialStatePropertyAll(Colors.red),
//       ),
//       onPressed: () {
//         checkAnwer(false, data.result);
//       },
//       child: Text(
//         'False',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 24.0,
//         ),
//       ),
//     ),
//   ),
// ),
