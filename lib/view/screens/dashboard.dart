import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingo/controller/dashboard_controller.dart';
import 'package:lingo/view/screens/quiz/Quiz_Screen.dart';

import 'home/home_screen.dart';
import 'profile/profile_screen.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _screens = const <Widget>[
    HomeScreen(),
    QuizScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(dashboardIndexProvider);
    return Scaffold(
      body: SafeArea(
        child: _screens.elementAt(index),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CurvedNavigationBar(
            height: 44,
            items: const [
              Icon(Icons.home, color: Colors.black),
              Icon(Icons.quiz, color: Colors.black),
              Icon(Icons.person, color: Colors.black),
            ],
            index: index,
            color: Colors.white,
            backgroundColor:
                MediaQuery.of(context).platformBrightness == Brightness.dark
                    ? const Color(0xff101d28)
                    : const Color(0xf8f8f8),
            onTap: (int newIndex) => ref
                .read(dashboardIndexProvider.notifier)
                .update((state) => newIndex),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 6.0).copyWith(left: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: labelList
                  .asMap()
                  .entries
                  .map((e) => e.key == index ? _label(e.value) : _label(""))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

const labelList = ["Ana Sayfa", "Test", "Profil"];
Widget _label(String label) => Expanded(
      child: Center(
        child: Text(
          label,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
