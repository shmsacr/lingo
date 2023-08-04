import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingo/view/theme/app_colors.dart';
import 'package:lingo/view/widget/custom_text_widget.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: AppColors.appGeneralLigthGrey,
              ),
            ),
            title: CustomTextWidget(
              text: 'İsim Soyisim',
              color: Colors.white,
            ),
          ),
          Divider(
            color: Colors.white,
            thickness: 2,
          ),
          ListTile(
            leading: Icon(Icons.dark_mode_outlined, color: Colors.white),
            title: CustomTextWidget(
              text: 'Tema Değiş',
              color: Colors.white,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
    ));
  }
}
