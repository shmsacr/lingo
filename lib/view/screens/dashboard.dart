import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingo/controller/riverpod/dashboard_controller.dart';
import 'package:lingo/view/screens/quiz/Quiz_Screen.dart';

import 'home/home_screen.dart';
import 'profile/profile_screen.dart';


@RoutePage()
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

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
          BottomNavigationBar(
            iconSize: 30,
            elevation: 10,
            items: [
              BottomNavigationBarItem(
                label: 'Ana Sayfa',
                icon: Icon(
                  Icons.home,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Quiz',
                icon: Icon(
                  Icons.quiz,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Profil',
                icon: Icon(Icons.person),
              ),
            ],
            currentIndex: index,
            onTap: (int newIndex) => ref
                .read(dashboardIndexProvider.notifier)
                .update((state) => newIndex),
          ),
          // Padding(
          //   padding:
          //       const EdgeInsets.symmetric(vertical: 6.0).copyWith(left: 10.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: labelList
          //         .asMap()
          //         .entries
          //         .map((e) => e.key == index ? _label(e.value) : _label(""))
          //         .toList(),
          //   ),
          // ),
        ],
      ),
    );
  }
}

// const labelList = ["Ana Sayfa", "Test", "Profil"];
// Widget _label(String label) => Expanded(
//       child: Center(
//         child: CustomTextWidget(
//           text: label,
//           color: Colors.white,
//         ),
//       ),
//     );
