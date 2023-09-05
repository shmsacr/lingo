import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:lingo/controller/riverpod/speaker_controller.dart';
import 'package:lingo/controller/riverpod/suggested_words_controller.dart';
import 'package:lingo/view/theme/app_colors.dart';
import 'package:lingo/view/widget/custom_text_widget.dart';

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
                  return Card(
                    elevation: 10,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 40),
                      titleAlignment: ListTileTitleAlignment.center,
                      //onTap: () => _showBottomSheet(isdata),
                      trailing: IconButton(
                        onPressed: () async {
                          speak(_suggestedCt?[index].eng ?? "");
                        },
                        icon: Icon(
                          Icons.volume_up_rounded,
                          color: AppColors.appBlue,
                        ),
                      ),
                      title: CustomTextWidget(
                        text: _suggestedCt?[index].eng ?? "",
                        fontsize:
                            context.general.textTheme.titleMedium?.fontSize,
                        fontWeight: FontWeight.w900,
                      ),
                      subtitle: CustomTextWidget(
                        text: _suggestedCt?[index].tr ?? "",
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
