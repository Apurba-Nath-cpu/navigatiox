import 'dart:math';

import 'package:flutter/material.dart';

/// A [PageRouteBuilder] that provides a "flip" transition animation for page navigation.
/// 
/// The [FlipPageRoute] class is used to create a page route that transitions the next page
/// into view with a "flip" animation. The animation can be configured to use different
/// axis directions and inclinations, as well as whether to fade in the next page.
/// The [currentPage] parameter is the widget that is currently displayed on the screen.
/// The [nextPage] parameter is the widget that will be displayed on the new page.
/// The [animationDuration] parameter specifies the duration of the animation, with a default of 500 milliseconds.
/// The [axis] parameter specifies the axis along which the flip animation should occur, with a default of [AxisDirection.left].
/// The [fadeIn] parameter determines whether the next page should fade in or not, with a default of `true`.
/// The [forward] parameter determines whether the flip animation should go from front to back (`true`) or back to front (`false`), with a default of `false`.
/// This method uses the [FlipPageRoute] class to create the custom transition animation.
class FlipPageRoute extends PageRouteBuilder {
  final Widget nextPage;
  final Widget currentPage;
  final Duration animationDuration;
  final AxisDirection axis;
  final bool fadeIn;
  final bool forward;

  FlipPageRoute({
    required this.nextPage,
    required this.currentPage,
    this.animationDuration = const Duration(milliseconds: 500),
    this.axis = AxisDirection.left,
    this.fadeIn = true,
    this.forward = false,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => nextPage,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return AnimatedBuilder(
              animation: animation,
              child: nextPage,
              builder: (context, child) {
                final double angle = ((1.0 - animation.value) * (pi / 2));
                final double opacity = animation.value;
                bool adjustedForward = forward;
                if (axis == AxisDirection.right || axis == AxisDirection.up) {
                  adjustedForward = !forward;
                }

                final int direction = adjustedForward ? 1 : -1;
                Matrix4 transform = Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(direction * angle);

                if (axis == AxisDirection.up || axis == AxisDirection.down) {
                  transform = Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(direction * angle);
                }

                return Transform(
                  transform: transform,
                  alignment: (axis == AxisDirection.left)
                      ? Alignment.centerLeft
                      : (axis == AxisDirection.right)
                          ? Alignment.centerRight
                          : (axis == AxisDirection.up)
                              ? Alignment.topCenter
                              : Alignment.bottomCenter,
                  child: Opacity(
                    opacity: fadeIn ? opacity : 1.0,
                    child: child,
                  ),
                );
              },
            );
          },
          transitionDuration: animationDuration,
        );
}
