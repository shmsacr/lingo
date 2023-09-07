import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:lingo/controller/riverpod/suggested_words_controller.dart';
import 'package:lingo/view/theme/app_colors.dart';
import 'package:lingo/view/widget/custom_text_widget.dart';
import 'package:uuid/uuid.dart';

import '../../../controller/riverpod/db_controller.dart';
import '../../../data/model/word_model.dart';

@RoutePage()
class SuggestedScreen extends ConsumerStatefulWidget {
  const SuggestedScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SuggestedScreenState();
}

class _SuggestedScreenState extends ConsumerState<SuggestedScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        ref.read(SuggestedStateNotifierProvider.notifier).getSuggestedWords());
  }

  @override
  Widget build(BuildContext context) {
    final _suggestedCt =
        ref.watch(SuggestedStateNotifierProvider).suggestedWords;
    final _isLoading = ref.watch(SuggestedStateNotifierProvider).isLoading;
    final uuid = Uuid().v1();

    return Scaffold(
      appBar: AppBar(
        title: Text("Kelime Önerileri"),
      ),
      body: _isLoading ?? true
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.appBlue,
              ),
            )
          : Center(
              child: ListView.builder(
                itemCount: _suggestedCt?.length,
                itemBuilder: (context, index) {
                  final words = _suggestedCt![index];
                  return Card(
                    elevation: 10,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 40),
                      titleAlignment: ListTileTitleAlignment.center,

                      //onTap: () => _showBottomSheet(isdata),
                      trailing: MaterialButton(
                        onPressed: () async {
                          DateTime now = DateTime.now();
                          final Words myWord = Words.fromJson({
                            "word": words.ENG,
                            "means": words.TR,
                            "spouse": null,
                            "sentence": null,
                            "id": uuid,
                            "addedDate": now.toString()
                          });
                          ref
                              .read(SuggestedStateNotifierProvider.notifier)
                              .deleteSuggestedWord(words.id);
                          try {
                            ref.read(addWordProvider(myWord));
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text("Kelimesi eklendi: ${words.ENG}")),
                              );
                            }
                          } catch (e) {
                            debugPrint(e.toString());
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text("$e")));
                          }
                        },
                        child: Icon(
                          Icons.add_circle,
                          color: Colors.green,
                        ),
                      ),
                      title: CustomTextWidget(
                        text: words.ENG ?? "adaw",
                        fontsize:
                            context.general.textTheme.titleMedium?.fontSize,
                        fontWeight: FontWeight.w900,
                      ),
                      subtitle: CustomTextWidget(
                        text: words.TR ?? "",
                        fontWeight: FontWeight.w500,
                        fontsize:
                            context.general.textTheme.titleMedium?.fontSize,
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
