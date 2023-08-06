import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:lingo/controller/riverpod/time_controller.dart';
import 'package:lingo/view/widget/custom_text_widget.dart';

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
    ref.read(timerProvider.notifier).startTimer();
  }

  List<Icon> scoreKeeper = [];

  bool isLoading = true;

  Future<void> checkAnwer(bool userChoice, bool result) async {
    isLoading = false;
    if (userChoice == result) {
      ref.refresh(cardColorProvider.notifier).state = Colors.green;
      ref.refresh(textColorProvider.notifier).state = Colors.white;
      ref.read(scoreProvider.notifier).state++;
      print("Dogru yapıldı");
    } else {
      ref.refresh(cardColorProvider.notifier).state = Colors.red;
      ref.refresh(textColorProvider.notifier).state = Colors.white;
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
    final timerValue = ref.watch(timerProvider);
    final initialDuration = Duration(minutes: 1).inSeconds;

    double progressValue = (initialDuration - timerValue) / initialDuration;
    return WillPopScope(
      onWillPop: () async {
        ref.read(timerProvider.notifier).timerReset();
        ref.invalidate(trueFalseProvider);
        ref.invalidate(scoreProvider);
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(timerValue.toString()),
            actions: [],
          ),
          body: timerValue == 0
              ? Center(
                  child: CustomTextWidget(
                    text: "Score: ${score.state}",
                    color: Colors.white,
                  ),
                )
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
                                            text:
                                                data.word + " = " + data.means,
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
                              LinearProgressIndicator(
                                value: progressValue,
                                color: Colors.amber,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      isLoading
                                          ? checkAnwer(false, data.result)
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
                                      isLoading
                                          ? checkAnwer(true, data.result)
                                          : null;
                                    },
                                    icon: Icon(
                                      Icons.check_circle,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                  error: (error, _) => Text(error.toString()),
                  loading: () => CircularProgressIndicator())),
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
