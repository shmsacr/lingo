import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingo/core/const/string_const.dart';
import 'package:kartal/kartal.dart';
import 'package:lingo/core/enums/image_enums.dart';
import 'package:lingo/view/theme/app_colors.dart';
import 'package:lingo/view/widget/custom_text_widget.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: context.padding.normal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget(
                  text: StringConst.quizAppName,
                  fontsize: context.general.textTheme.titleLarge?.fontSize,
                ),
                SizedBox(
                  height: context.sized.dynamicHeight(0.02),
                ),
                SizedBox(
                  height: 170,
                  child: _QuizLearnCard(),
                ),
                SizedBox(
                  height: context.sized.dynamicHeight(0.1),
                ),

                //çoktan seçmeli
                _PracticalCard(
                  text: StringConst.multipleChoice,
                  subtitle: StringConst.multipleChoice,
                  imageURL: ImageEnum.choose.toPng,
                  cardBordeColor: AppColors.green,
                ),
                // true false
                _PracticalCard(
                  text: StringConst.trueAndFalse,
                  subtitle: StringConst.trueAndFalse,
                  imageURL: ImageEnum.trueFalse.toPng,
                  cardBordeColor: AppColors.red,
                ),
                // kelime yazma
                _PracticalCard(
                  text: StringConst.writingPractice,
                  subtitle: StringConst.writingPractice,
                  imageURL: ImageEnum.creativeWriting.toPng,
                  cardBordeColor: AppColors.blue,
                ),

                // karışık
                _PracticalCard(
                  text: StringConst.mixedPractice,
                  subtitle: StringConst.mixedPractice,
                  imageURL: ImageEnum.quiz.toPng,
                  cardBordeColor: AppColors.purple,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PracticalCard extends StatelessWidget {
  const _PracticalCard(
      {required this.text,
      required this.subtitle,
      required this.imageURL,
      required this.cardBordeColor});

  final String text;
  final String subtitle;
  final String imageURL;
  final Color cardBordeColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: cardBordeColor,
          ),
        ),
        child: Padding(
          padding: context.padding.onlyTopLow,
          child: ListTile(
            title: CustomTextWidget(
              text: text,
              fontsize: context.general.textTheme.titleMedium?.fontSize,
              color: cardBordeColor,
            ),
            subtitle: CustomTextWidget(
              text: subtitle,
              fontsize: context.general.textTheme.bodySmall?.fontSize,
              color: cardBordeColor,
            ),
            trailing: Image.asset(imageURL),
          ),
        ),
      ),
    );
  }
}

class _QuizLearnCard extends StatelessWidget {
  const _QuizLearnCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: AppColors.primary,
        ),
      ),
      child: Padding(
        padding: context.padding.onlyTopNormal,
        child: Column(
          children: [
            _QuizAppTitle(),
            _Divider(),
            _ListTileRow(),
          ],
        ),
      ),
    );
  }
}

class _QuizAppTitle extends StatelessWidget {
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

class _ListTileRow extends StatelessWidget {
  const _ListTileRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
            child: Padding(
          padding: context.padding
              .onlyLeftHigh, // PADDING DEĞİŞ EXPNADED KALKACAK, CENTER ALACAK
          child:
              _CustomQuizListTile(title: '121212', subtitle: 'Toplam Kelime'),
        )),
      ],
    );
  }
}

class _CustomQuizListTile extends StatelessWidget {
  const _CustomQuizListTile({
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: context.padding.onlyLeftMedium,
      title: CustomTextWidget(
        text: title,
        fontsize: context.general.textTheme.titleMedium?.fontSize,
      ),
      subtitle: CustomTextWidget(
        text: subtitle,
        fontsize: context.general.textTheme.bodySmall?.fontSize,
      ),
    );
  }
}

class _Divider extends StatelessWidget {
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
