import 'package:flutter/material.dart';

/// A [PageRouteBuilder] that provides a "fade and scale" transition animation for page navigation.
/// The [FadeScalePageRoute] class is used to create a page route that transitions the next page
/// into view with a "fade and scale" animation. The animation can be configured to use different
/// axis directions and inclinations, as well as whether to fade in the next page.
/// The [currentPage] parameter is the widget that is currently displayed on the screen.
/// The [nextPage] parameter is the widget that will be displayed on the new page.
/// The [initialScale] parameter specifies the initial scale of the page being pushed, with a default of 0.0.
/// The [animationDuration] parameter specifies the duration of the animation, with a default of 500 milliseconds.
class FadeScalePageRoute extends PageRouteBuilder {
  final Widget nextPage;
  final Widget currentPage;
  final double initialScale;
  final Duration animationDuration;

  FadeScalePageRoute(
      {required this.nextPage,
      required this.currentPage,
      this.initialScale = 0.0,
      this.animationDuration = const Duration(milliseconds: 500)})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => nextPage,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: Tween<double>(begin: initialScale.abs(), end: 1.0)
                    .animate(animation),
                child: child,
              ),
            );
          },
          transitionDuration: animationDuration,
        );
}
