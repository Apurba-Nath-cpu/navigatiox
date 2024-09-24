import 'dart:math';
import 'package:flutter/material.dart';

/// A [PageRouteBuilder] that provides a "fly in" transition animation for page navigation.
///
/// The [FlyInPageRoute] class is used to create a page route that transitions the next page
/// into view with a "fly in" animation. The animation can be configured to use different
/// axis directions and inclinations, as well as whether to fade in the next page.
class FlyInPageRoute extends PageRouteBuilder {
  final Widget nextPage;
  final Widget currentPage;
  final Duration animationDuration;
  final AxisDirection axis;
  final AxisDirection inclination;
  final bool fadeIn;
  final bool forward;

  FlyInPageRoute({
    required this.nextPage,
    required this.currentPage,
    this.animationDuration = const Duration(milliseconds: 500),
    this.axis = AxisDirection.left,
    this.inclination = AxisDirection.up,
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
                if (axis == AxisDirection.left || axis == AxisDirection.down) {
                  adjustedForward = !forward;
                }

                final int direction = adjustedForward ? -1 : 1;
                Matrix4 transform = Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(direction * angle);

                if (axis == AxisDirection.up || axis == AxisDirection.down) {
                  transform = Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(direction * angle);
                }

                AlignmentGeometry? alignmentAxis;

                if (axis == AxisDirection.left) {
                  if (inclination == AxisDirection.up) {
                    alignmentAxis = AlignmentGeometry.lerp(
                        Alignment.topLeft, Alignment.topRight, animation.value);
                  } else {
                    alignmentAxis = AlignmentGeometry.lerp(Alignment.bottomLeft,
                        Alignment.bottomRight, animation.value);
                  }
                } else if (axis == AxisDirection.right) {
                  if (inclination == AxisDirection.up) {
                    alignmentAxis = AlignmentGeometry.lerp(
                        Alignment.topRight, Alignment.topLeft, animation.value);
                  } else {
                    alignmentAxis = AlignmentGeometry.lerp(
                        Alignment.bottomRight,
                        Alignment.bottomLeft,
                        animation.value);
                  }
                } else if (axis == AxisDirection.up) {
                  if (inclination == AxisDirection.left) {
                    alignmentAxis = AlignmentGeometry.lerp(
                        Alignment.topRight, Alignment.topLeft, animation.value);
                  } else {
                    alignmentAxis = AlignmentGeometry.lerp(
                        Alignment.topLeft, Alignment.topRight, animation.value);
                  }
                } else {
                  if (inclination == AxisDirection.left) {
                    alignmentAxis = AlignmentGeometry.lerp(
                        Alignment.bottomRight,
                        Alignment.bottomLeft,
                        animation.value);
                  } else {
                    alignmentAxis = AlignmentGeometry.lerp(Alignment.bottomLeft,
                        Alignment.bottomRight, animation.value);
                  }
                }

                return Transform(
                  transform: transform,
                  alignment: alignmentAxis,
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
