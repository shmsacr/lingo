import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:lingo/controller/riverpod/db_controller.dart';
import 'package:lingo/core/const/string_const.dart';
import 'package:lingo/view/screens/quiz/mixin/QuizScreenMixin.dart';
import 'package:lingo/view/theme/app_colors.dart';
import 'package:lingo/view/widget/custom_text_widget.dart';

@RoutePage()
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
              children: [
                _QuizLearnCard(),
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
class PracticalCard extends StatelessWidget {
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: textCardColor,
              width: 2,
            ),
          ),
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
final class _QuizLearnCard extends StatelessWidget {
  const _QuizLearnCard();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.general.mediaQuery.size.width,
      height: context.general.mediaQuery.size.height * 0.25,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _QuizAppTitle(),
            _Divider(),
            _CustomQuizListTile(),
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

@immutable
final class _CustomQuizListTile extends StatelessWidget {
  const _CustomQuizListTile();

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Column(
        children: [
          Card(
            elevation: 5,
            color: AppColors.appBlue,
            child: Align(
              widthFactor: 2,
              heightFactor: 1.5,
              alignment: Alignment.center,
              child: CustomTextWidget(
                text: ref.read(wordsProvider).value!.length.toString(),
                fontsize: context.general.textTheme.titleMedium?.fontSize,
                color: Colors.white,
              ),
            ),
          ),
          CustomTextWidget(
            text: "Toplam Kelime",
            fontsize: context.general.textTheme.bodyMedium?.fontSize,
          ),
        ],
      );
    });
  }
}

@immutable
final class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.primary,
      height: 1,
      thickness: 2,
      indent: 80,
      endIndent: 80,
    );
  }
}
