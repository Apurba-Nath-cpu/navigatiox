import 'dart:math';

import 'package:flutter/material.dart';

/// A [PageRouteBuilder] that provides a "swirl" transition animation for page navigation.
/// The [SwirlPageRoute] class is used to create a page route that transitions the next page
/// into view with a "swirl" animation. The animation can be configured to use different
/// axis directions and inclinations, as well as whether to fade in the next page.
/// The [currentPage] parameter is the widget that is currently displayed on the screen.
/// The [nextPage] parameter is the widget that will be displayed on the new page.
/// The [animationDuration] parameter specifies the duration of the animation, with a default of 500 milliseconds.
/// The [numberOfHalfRotations] parameter specifies the number of half rotations to apply, with a default of 1.
/// The [forward] parameter determines whether the swirl animation should go from front to back (`true`) or back to front (`false`), with a default of `true`.
/// The [axis] parameter specifies the axis along which the swirl animation should occur, with a default of [Axis.vertical].
/// This method uses the [SwirlPageRoute] class to create the custom transition animation.
class SwirlPageRoute extends PageRouteBuilder {
  final Widget nextPage;
  final Widget currentPage;
  final int numberOfHalfRotations;
  final bool forward;
  final Duration animationDuration;
  final Axis axis;

  SwirlPageRoute(
      {required this.nextPage,
      required this.currentPage,
      this.numberOfHalfRotations = 1,
      this.forward = true,
      this.axis = Axis.vertical,
      this.animationDuration = const Duration(milliseconds: 500)})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => nextPage,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return AnimatedBuilder(
              animation: animation,
              child: child,
              builder: (context, child) {
                final bool isUnder = (animation.value > 0.5);
                final int direction = forward ? 1 : -1;
                final double angle =
                    animation.value * numberOfHalfRotations * direction * pi;
                Matrix4 transform = Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(angle);

                if (axis == Axis.horizontal) {
                  transform = Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(angle);
                }

                return Transform(
                  transform: transform,
                  alignment: Alignment.center,
                  child: isUnder
                      ? Transform(
                          transform: axis == Axis.horizontal
                              ? Matrix4.rotationX(numberOfHalfRotations % 2 == 1
                                  ? (pi * direction)
                                  : 0)
                              : Matrix4.rotationY(numberOfHalfRotations % 2 == 1
                                  ? (pi * direction)
                                  : 0),
                          alignment: Alignment.center,
                          child: child,
                        )
                      : currentPage,
                );
              },
            );
          },
          transitionDuration: animationDuration,
        );
}
