import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../data/model/word_model.dart';
import '../../view/screens/dashboard.dart';
import '../../view/screens/home/add_word_screen/add_word_screen.dart';
import '../../view/screens/home/home_screen.dart';
import '../../view/screens/profile/profile_screen.dart';
import '../../view/screens/quiz/Quiz_Screen.dart';
import '../../view/screens/quiz/listening_quiz/listeningScreen.dart';
import '../../view/screens/quiz/mixed_quiz/mixed_quiz.dart';
import '../../view/screens/quiz/multiple_choice/multiple_choice_screen.dart';
import '../../view/screens/quiz/true_false_quiz/true_false_screen.dart';
import '../../view/screens/suggested/suggested_screen.dart';
import '../../view/screens/writing_exercises/writing_exercises_screen.dart';

part 'auto_router_controller.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => RouteType.custom(
        durationInMilliseconds: 1000,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: SafeArea(
              child: Scaffold(
                extendBody: true,
                extendBodyBehindAppBar: true,
                body: child,
                bottomNavigationBar: DashboardScreen(),
              ),
            ),
          );
        },
      );
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeScreenRoute.page, initial: true),
        AutoRoute(page: QuizScreenRoute.page),
        AutoRoute(page: ProfileScreenRoute.page),
        AutoRoute(page: AddWordScreenRoute.page),
        AutoRoute(page: MultipleChoiceScreenRoute.page),
        AutoRoute(page: TrueFalseScreenRoute.page),
        AutoRoute(page: WritingExercisesScreenRoute.page),
        AutoRoute(page: ListeningScreenRoute.page),
        AutoRoute(page: SuggestedScreenRoute.page)
      ];
}
