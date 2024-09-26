import 'package:flutter/material.dart';

/// A [PageRouteBuilder] that creates a rotate transition between pages.
///
/// The [RotatePageRoute] creates a transition where the next page rotates into view,
/// with the current page rotating out of view. The rotation can be clockwise or
/// counterclockwise, and the number of turns can be specified.
///
/// The [nextPage] and [currentPage] parameters are the pages to be transitioned.
/// The [numberOfTurns] parameter specifies the number of full rotations the next
/// page will make, and the [clockwise] parameter determines the direction of
/// the rotation.
///
/// The [animationDuration] parameter specifies the duration of the animation.
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
