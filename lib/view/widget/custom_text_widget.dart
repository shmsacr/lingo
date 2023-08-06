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
          fontSize: fontsize ?? context.general.textTheme.bodyMedium?.fontSize,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: color ??
              (context.general.appBrightness == Brightness.dark
                  ? Colors.red
                  : Colors.yellow)),
    );
  }
}
