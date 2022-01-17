import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ornek_proje/core/constants/router_constants.dart';
import 'package:ornek_proje/ui/auth/landing/landing_page.dart';
import 'package:ornek_proje/ui/auth/login/login_page.dart';
import 'package:ornek_proje/ui/home/home_page.dart';
import 'package:ornek_proje/ui/home/navigation_bar/select/quiz/quiz_page.dart';
import 'package:ornek_proje/ui/home/navigation_bar/select/select_page.dart';

class NavigationRoute {
  static NavigationRoute _instace;
  static NavigationRoute get instance {
    _instace ??= NavigationRoute._init();
    return _instace;
  }

  NavigationRoute._init();

  Route<CupertinoPageRoute> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final arguments = settings.arguments; //argumanlar
    switch (settings.name) {
      case RouteConstant.LANDING_PAGE_ROUTE:
        return CupertinoPageRoute(builder: (_) => const LandingPage());
      case RouteConstant.HOME_PAGE_ROUTE:
        return CupertinoPageRoute(builder: (_) => const HomePage());
      case RouteConstant.LOGIN_PAGE_ROUTE:
        return CupertinoPageRoute(builder: (_) => LoginPage());
      case RouteConstant.SELECT_PAGE_ROUTE:
        return CupertinoPageRoute(builder: (_) => const SelectPage());
      case RouteConstant.QUIZ_PAGE_ROUTE:
        return CupertinoPageRoute(builder: (_) => const QuizPage());
      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('Hata'),
              centerTitle: true,
            ),
            body: const Center(
              child: Text('Ters giden bir şeyler oldu'),
            ),
          ),
        );
    }
  }
}
