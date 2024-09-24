import 'package:flutter/material.dart';

/// A custom [PageRoute] that slides the page in from the specified [direction].
/// 
/// This [PageRoute] implementation provides a sliding animation when transitioning
/// between pages. The [page] parameter specifies the widget to be displayed,
/// and the [direction] parameter determines the direction of the slide animation.
/// The [animationDuration] parameter specifies the duration of the animation.
class SlidePageRoute extends PageRouteBuilder {
  final Widget page;
  final AxisDirection direction;
  final Duration animationDuration;

  SlidePageRoute(
      {required this.page,
      this.direction = AxisDirection.left,
      this.animationDuration = const Duration(milliseconds: 500)})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final Offset initialOffset;
            if (direction == AxisDirection.left) {
              initialOffset = const Offset(-1.0, 0.0);
            } else if (direction == AxisDirection.right) {
              initialOffset = const Offset(1.0, 0.0);
            } else if (direction == AxisDirection.up) {
              initialOffset = const Offset(0.0, -1.0);
            } else {
              initialOffset = const Offset(0.0, 1.0);
            }

            return SlideTransition(
              position: Tween<Offset>(
                begin: initialOffset,
                end: const Offset(0.0, 0.0),
              ).animate(animation),
              child: child,
            );
          },
          transitionDuration: animationDuration,
        );
}
