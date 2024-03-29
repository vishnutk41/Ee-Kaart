

import 'package:flutter/material.dart';

class RouteManager {
  Route createAnimatingRoute(Widget nextPage) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => nextPage,
    transitionDuration: Duration(seconds: 1), // Extended duration for a slower effect
    reverseTransitionDuration: Duration(seconds: 1), // Also slow when popping the route
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut, // A smooth curve for more gradual transition
        reverseCurve: Curves.easeInOut,
      );
      return FadeTransition(
        opacity: curvedAnimation, // Use the curvedAnimation for opacity
        child: child,
      );
    },
  );
}

  Route createRoute(Widget nextPage) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => nextPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // Start from the right
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var slideAnimation = animation.drive(tween);

      return SlideTransition(
        position: slideAnimation,
        child: child,
      );
    },
  );
}

}

