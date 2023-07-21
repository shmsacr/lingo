import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lingo/view/theme/app_colors.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    required this.text,
    super.key,
    this.fontsize,
    this.fontWeight,
  });
  final double? fontsize;
  final FontWeight? fontWeight;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize ?? context.general.textTheme.bodyMedium?.fontSize,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: AppColors.accent,
      ),
    );
  }
}
