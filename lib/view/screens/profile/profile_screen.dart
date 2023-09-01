import 'package:day_night_switch/day_night_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingo/view/theme/app_colors.dart';
import 'package:lingo/view/widget/custom_text_widget.dart';

import '../../../controller/riverpod/settings_controller.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkTheme = ref.watch(settingProvider).themeMode;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.settings,
                color: AppColors.appGeneralLigthGrey,
              ),
            ),
            title: CustomTextWidget(
              text: 'Ayarlar',
              color: Colors.white,
            ),
          ),
          Divider(
            color: Colors.white,
            thickness: 2,
          ),
          ListTile(
              leading: Icon(
                  isDarkTheme ? Icons.dark_mode_outlined : Icons.light_mode,
                  color: isDarkTheme ? Color(0xfffdeeb3) : Colors.orange),
              title: CustomTextWidget(
                text: 'Tema Değiş',
              ),
              trailing: Transform.scale(
                scale: 0.5,
                child: DayNightSwitch(
                  moonImage: AssetImage('assets/icons/moon.png'),
                  value: isDarkTheme,
                  onChanged: (_) {
                    ref.read(settingProvider).toggleTheme();
                  },
                ),
              )),
        ],
      ),
    ));
  }
}
