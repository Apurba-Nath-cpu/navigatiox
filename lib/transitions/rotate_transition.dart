import 'package:flutter/material.dart';

/// A [PageRouteBuilder] that provides a "rotate" transition animation for page navigation.
/// The [RotatePageRoute] class is used to create a page route that transitions the next page
/// into view with a "rotate" animation. The animation can be configured to use different
/// axis directions and inclinations, as well as whether to fade in the next page.
/// The [currentPage] parameter is the widget that is currently displayed on the screen.
/// The [nextPage] parameter is the widget that will be displayed on the new page.
/// The [animationDuration] parameter specifies the duration of the animation, with a default of 500 milliseconds.
/// The [numberOfRotations] parameter specifies the number of rotations to apply, with a default of 1.
/// The [clockwise] parameter specifies whether the rotations should be clockwise (`true`) or counter-clockwise (`false`), with a default of `true`.
/// This method uses the [RotatePageRoute] class to create the custom transition animation.
class RotatePageRoute extends PageRouteBuilder {
  final Widget nextPage;
  final Widget currentPage;
  final int numberOfRotations;
  final bool clockwise;
  final Duration animationDuration = const Duration(milliseconds: 500);

  RotatePageRoute({
    required this.nextPage,
    required this.currentPage,
    this.numberOfRotations = 1,
    this.clockwise = true,
    animationDuration = const Duration(milliseconds: 500),
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => nextPage,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final double rotationFactor = clockwise ? -1.0 : 1.0;

            return RotationTransition(
              turns: Tween<double>(
                begin: numberOfRotations.toDouble() * rotationFactor,
                end: 0.0,
              ).animate(animation),
              child: animation.value.abs() > 0.5 ? child : currentPage,
            );
          },
          transitionDuration: animationDuration,
        );
}
