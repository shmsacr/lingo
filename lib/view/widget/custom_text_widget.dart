import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      {required this.text,
      super.key,
      this.fontsize,
      this.fontWeight,
      this.color});
  final double? fontsize;
  final FontWeight? fontWeight;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontsize ?? context.general.textTheme.titleLarge?.fontSize,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: color ??
              (context.general.appBrightness == Brightness.dark
                  ? Colors.red
                  : Color(0xFF0081A8).withOpacity(0.8))),
    );
  }
}
