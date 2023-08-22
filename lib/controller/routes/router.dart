import 'package:flutter/material.dart';
import 'package:lingo/view/screens/dashboard.dart';
import 'package:lingo/view/screens/home/add_word_screen.dart';
import 'package:lingo/view/screens/home/home_screen.dart';
import 'package:lingo/view/screens/profile/profile_screen.dart';
import 'package:lingo/view/screens/quiz/Quiz_Screen.dart';
import 'package:lingo/view/screens/quiz/listening_quiz/listeningScreen.dart';
import 'package:lingo/view/screens/quiz/mixed_quiz/mixed_quiz.dart';
import 'package:lingo/view/screens/quiz/multiple_choice/multiple_choice_screen.dart';
import 'package:lingo/view/screens/quiz/true_false_quiz/true_false_screen.dart';
import 'package:lingo/view/screens/writing_exercises/writing_exercises_screen.dart';

class Router {
  static const String dashboard = '/';
  static const String addWord = '/addWord';
  static const String home = '/home';
  static const String quiz = '/quiz';
  static const String multipleChoice = '/multipleChoice';
  static const String profile = '/profile';
  static const String denemePage = '/writePage';
  static const String mixedQuiz = '/mixedQuiz';
  static const String trueFalseScreen = '/trueFalse';

  static Route<RouteSettings> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case '/addWord':
        return MaterialPageRoute(builder: (_) => const AddWord());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case '/quiz':
        return MaterialPageRoute(builder: (_) => const QuizScreen());

      case '/multipleChoice':
        return MaterialPageRoute(builder: (_) => const MultipleChoiceScreen());

      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      case '/writePage':
        return MaterialPageRoute(
            builder: (_) => const WritingExercisesScreen());
      case '/trueFalse':
        return MaterialPageRoute(builder: (_) => const TrueFalseScreen());

      case '/listening':
        return MaterialPageRoute(builder: (_) => const ListeningScreen());

      case '/mixedQuiz':
        return MaterialPageRoute(builder: (_) => const MixedQuiz());

      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
