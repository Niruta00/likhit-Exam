import 'package:flutter/material.dart';
import 'package:quizapp/view/choose_set_screen.dart';
import 'package:quizapp/view/home_page.dart';
import 'package:quizapp/view/news/news.dart';
import 'package:quizapp/view/quiz_body.dart';
import 'package:quizapp/view/quiz_result.dart';
import 'package:quizapp/view/traffic_sign/traffic_symbols.dart';

import 'routes.dart';


class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
        case Routes.giveexam:
        return MaterialPageRoute(builder: (_) =>  QuizBody());
         case Routes.quizresult:
        return MaterialPageRoute(builder: (_) =>  QuizResultScreen());
          case Routes.trafficsign:
        return MaterialPageRoute(builder: (_) =>  TrafficSymbolsScreen());
                 case Routes.choosesets:
        return MaterialPageRoute(builder: (_) =>  ChooseSetScreen( ));
        case Routes.newws:
        return MaterialPageRoute(builder: (_) =>  News());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
