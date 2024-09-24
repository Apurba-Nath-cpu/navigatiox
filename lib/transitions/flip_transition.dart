import 'dart:math';

import 'package:flutter/material.dart';

/// A custom PageRoute that implements a flip transition animation.
/// 
/// This PageRoute is used to transition between pages in a Flutter application,
/// with a flip animation effect. The animation can be configured to flip
/// horizontally or vertically, and to fade in the new page.
///
/// The [nextPage] and [currentPage] parameters are the widgets to be displayed
/// during the transition. The [animationDuration] parameter controls the
/// duration of the animation, and the [axis] parameter controls the direction
/// of the flip (left, right, up, or down).
///
/// The [fadeIn] parameter determines whether the new page should fade in during
/// the transition, and the [forward] parameter controls the direction of the
/// flip (forward or reverse).
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
                final double angle =
                    ((1.0 - animation.value) * (pi / 2));
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