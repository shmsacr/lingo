import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../controller/riverpod/speaker_controller.dart';
import '../../../../controller/riverpod/writing_exercise_controller.dart';
import '../../../theme/app_colors.dart';
import '../../../widget/custom_text_widget.dart';

@RoutePage()
class ListeningScreen extends ConsumerStatefulWidget {
  const ListeningScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ListeningScreenState();
}

class _ListeningScreenState extends ConsumerState<ListeningScreen> {
  final myController = TextEditingController();
  String text = "";
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
    text = randomWord.value!.word;

    if (myController.text.isEmpty) {
      ref.watch(fillColorProvider.notifier).state =
          AppColors.appGeneralDarkGrey;
    } else if (myController.text.toLowerCase() ==
        randomWord.value?.word.toLowerCase()) {
      ref.refresh(fillColorProvider.notifier).state = Colors.green;
    } else {
      ref.refresh(fillColorProvider.notifier).state = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final randomWord = ref.watch(randomWordProvider);
    final fillerColor = ref.watch(fillColorProvider.notifier);

    return Scaffold(
        appBar: AppBar(
          title: Text('Listening Quiz'),
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
                              IconButton(
                                  onPressed: () {
                                    speak(data.word);
                                  },
                                  icon: Icon(
                                    Icons.volume_up,
                                    color: Colors.black45,
                                  )),
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
                                controller: myController,
                                decoration: InputDecoration(
                                  hintText: 'Kelimeyi buraya yazınız',
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                  suffixIcon: myController.text.toLowerCase() ==
                                          data.word.toLowerCase()
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
