import 'package:flutter/cupertino.dart';

class CustomRoutes {
  static Route movieInfoRoute(Widget destination, int milliseconds) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => destination,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: milliseconds),
        reverseTransitionDuration: Duration(milliseconds: milliseconds));
  }
}
