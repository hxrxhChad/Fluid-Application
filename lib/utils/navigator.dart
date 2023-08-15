import 'package:flutter/material.dart';

push(context, page) {
  Navigator.push(context, CustomPageRoute(builder: (_) => page));
}

replace(context, page) {
  Navigator.pushReplacement(context, CustomPageRoute(builder: (_) => page));
}

pop(context) {
  Navigator.pop(context);
}

popUntil(context) {
  Navigator.popUntil(context, (route) => route.isFirst);
}

class CustomPageRoute extends PageRouteBuilder {
  final WidgetBuilder builder;

  CustomPageRoute({required this.builder})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return builder(context);
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0), // Start position
                end: Offset.zero, // End position
              ).animate(animation),
              child: child,
            );
          },
        );
}
