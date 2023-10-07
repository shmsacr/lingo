import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

import '../../controller/riverpod/settings_controller.dart';

class CustomTextWidget extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    bool _themeMode = ref.watch(settingProvider).themeMode;

    return Text(
      text,
      style: TextStyle(
          fontSize: fontsize ?? context.general.textTheme.titleLarge?.fontSize,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: _themeMode ? Colors.white : Colors.black),
    );
  }
}
