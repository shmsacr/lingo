import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:lingo/controller/riverpod/words_controller.dart';
import 'package:lingo/core/const/string_const.dart';
import 'package:lingo/view/screens/quiz/mixin/QuizScreenMixin.dart';
import 'package:lingo/view/theme/app_colors.dart';
import 'package:lingo/view/widget/custom_text_widget.dart';

class QuizScreen extends ConsumerStatefulWidget with QuizScreenMixin {
  const QuizScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: context.padding.normal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: _QuizLearnCard(),
                ),
                SizedBox(
                  height: context.sized.dynamicHeight(0.1),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.getCards().length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        pushToSelectScreenQuiz(context, index, ref);
                      },
                      child: widget.getCards()[index]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

@immutable
final class PracticalCard extends StatelessWidget {
  PracticalCard({
    required this.text,
    required this.subtitle,
    required this.imageURL,
    required this.textCardColor,
  });

  final String text;
  final String subtitle;
  final String imageURL;
  final Color textCardColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: SizedBox(
        height: 120,
        child: Card(
          child: Padding(
            padding: context.padding.onlyTopLow,
            child: ListTile(
              title: CustomTextWidget(
                text: text,
                fontsize: context.general.textTheme.titleMedium?.fontSize,
                color: textCardColor,
              ),
              subtitle: CustomTextWidget(
                text: subtitle,
                fontsize: context.general.textTheme.bodySmall?.fontSize,
                color: textCardColor,
              ),
              trailing: Image.asset(imageURL),
            ),
          ),
        ),
      ),
    );
  }
}

@immutable
final class _QuizLearnCard extends ConsumerWidget {
  const _QuizLearnCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: context.padding.onlyTopNormal,
        child: Column(
          children: [
            _QuizAppTitle(),
            _Divider(),
            Container(
              child: _CustomQuizListTile(
                  title: ref.watch(wordListNotifierProvider).length.toString(),
                  subtitle: 'Toplam Kelime'),
            )
          ],
        ),
      ),
    );
  }
}

@immutable
final class _QuizAppTitle extends StatelessWidget {
  const _QuizAppTitle();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.flag,
          color: AppColors.primary,
        ),
        const CustomTextWidget(text: StringConst.quizAppName),
      ],
    );
  }
}

// @immutable
// final class _ListTileRow extends StatelessWidget {
//   const _ListTileRow({
//     required this.title,
//   });
//   final String title;
//   @override
//   Widget build(BuildContext context) {
//     return _CustomQuizListTile(title: title, subtitle: 'Toplam Kelime');
//   }
// }

@immutable
final class _CustomQuizListTile extends StatelessWidget {
  const _CustomQuizListTile({
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 100),
      child: ListTile(
        contentPadding: context.padding.onlyLeftMedium,
        title: CustomTextWidget(
          text: title,
          fontsize: context.general.textTheme.titleMedium?.fontSize,
        ),
        subtitle: CustomTextWidget(
          text: subtitle,
          fontsize: context.general.textTheme.bodySmall?.fontSize,
        ),
      ),
    );
  }
}

@immutable
final class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.primary,
      thickness: 3,
      indent: 80,
      endIndent: 80,
    );
  }
}
