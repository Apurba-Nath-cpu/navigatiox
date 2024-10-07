import 'package:flutter/material.dart';

/// A [PageRouteBuilder] that provides a "slide" transition animation for page navigation.
/// The [SlidePageRoute] class is used to create a page route that transitions the next page
/// into view with a "slide" animation. The animation can be configured to use different
/// axis directions and inclinations, as well as whether to fade in the next page.
/// The [currentPage] parameter is the widget that is currently displayed on the screen.
/// The [nextPage] parameter is the widget that will be displayed on the new page.
/// The [animationDuration] parameter specifies the duration of the animation, with a default of 500 milliseconds.
/// The [direction] parameter specifies the axis along which the slide animation should occur, with a default of [AxisDirection.left].
/// This method uses the [SlidePageRoute] class to create the custom transition animation.

class SlidePageRoute extends PageRouteBuilder {
  final Widget nextPage;
  final Widget currentPage;
  final AxisDirection direction;
  final Duration animationDuration;

  SlidePageRoute(
      {required this.nextPage,
      required this.currentPage,
      this.direction = AxisDirection.left,
      this.animationDuration = const Duration(milliseconds: 500)})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => nextPage,
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
