import 'dart:math';

import 'package:flutter/material.dart';

/// A custom page route that creates a swirling animation when transitioning between pages.
///
/// This page route takes two widgets, [nextPage] and [currentPage], and transitions between them
/// using a swirling animation. The animation can be configured with the [numHalfRotations],
/// [forward], [axis], and [animationDuration] parameters.
///
/// The [numHalfRotations] parameter determines the number of half rotations the animation will
/// perform. The [forward] parameter determines the direction of the animation (true for forward,
/// false for reverse). The [axis] parameter determines the axis of rotation (vertical or
/// horizontal). The [animationDuration] parameter determines the duration of the animation.
///
/// This page route can be used in a [Navigator] to create a custom transition between pages.
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
                final double angle = animation.value * numberOfHalfRotations * direction * pi; 
                Matrix4 transform =  
                  Matrix4.identity()
                    ..setEntry(3, 2, 0.001) 
                    ..rotateY(angle); 

                if(axis == Axis.horizontal) {
                  transform = Matrix4.identity()
                    ..setEntry(3, 2, 0.001) 
                    ..rotateX(angle);
                }

                return Transform(
                  transform: transform,
                  alignment: Alignment.center,
                  child: isUnder
                      ? Transform(
                          transform: axis == Axis.horizontal ?
                          Matrix4.rotationX(numberOfHalfRotations % 2 == 1 ? (pi * direction) : 0) :
                          Matrix4.rotationY(numberOfHalfRotations % 2 == 1 ? (pi * direction) : 0), 
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
