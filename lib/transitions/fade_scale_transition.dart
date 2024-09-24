import 'package:flutter/material.dart';

/// A [PageRouteBuilder] that creates a fade and scale transition for a page.
///
/// This transition fades the page in while also scaling it from a small initial size to its full size.
/// The [initialScale] parameter controls the starting scale of the page, and the [animationDuration]
/// parameter controls the duration of the transition animation.
class FadeScalePageRoute extends PageRouteBuilder {
  final Widget page;
  final double initialScale;
  final Duration animationDuration;

  FadeScalePageRoute(
      {required this.page,
      this.initialScale = 0.0,
      this.animationDuration = const Duration(milliseconds: 500)})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: Tween<double>(begin: initialScale.abs(), end: 1.0).animate(animation),
                child: child,
              ),
            );
          },
          transitionDuration: animationDuration,
        );
}
