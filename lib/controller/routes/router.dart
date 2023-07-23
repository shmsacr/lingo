import 'package:flutter/material.dart';
import 'package:lingo/view/screens/dashboard.dart';
import 'package:lingo/view/screens/home/home_screen.dart';
import 'package:lingo/view/screens/profile/profile_screen.dart';
import 'package:lingo/view/screens/quiz/Quiz_Screen.dart';

class Router {
  static const String dashboard = '';
  static const String home = 'home';
  static const String quiz = 'quiz';
  static const String profile = 'profile';
  static const String trueAndFalse = 'trueAndFalse';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case 'home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case 'quiz':
        return MaterialPageRoute(builder: (_) => const QuizScreen());

      case 'profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

        case 'trueAndFalse':
        return MaterialPageRoute(builder: (_) => const QuizScreen());
        

      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
