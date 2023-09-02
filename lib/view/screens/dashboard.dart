import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingo/controller/riverpod/dashboard_controller.dart';

import '../../controller/router/auto_router_controller.dart';

@RoutePage()
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  final List<PageRouteInfo> _screens = const <PageRouteInfo>[
    HomeScreenRoute(),
    QuizScreenRoute(),
    ProfileScreenRoute(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(dashboardIndexProvider);
    print(index);
    return BottomNavigationBar(
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
        onTap: (int newIndex) {
          ref.read(dashboardIndexProvider.notifier).update((state) => newIndex);
          context.router.push(_screens[newIndex]);
          print("new index $newIndex");
        });
  }
}
