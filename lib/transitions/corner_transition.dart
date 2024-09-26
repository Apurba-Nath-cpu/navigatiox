import 'package:flutter/material.dart';
import 'package:navigatiox/utils/corner_types.dart';

/// A custom PageRouteBuilder that creates a zoom transition animation when navigating to a new page.
///
/// The [page] parameter is the widget to be displayed on the new page.
/// The [corner] parameter specifies the corner of the screen where the transition should start from, with a default of [Corner.bottomLeft].
/// The [animationDuration] parameter specifies the duration of the transition animation, with a default of 500 milliseconds.
class CornerPageRoute extends PageRouteBuilder {
  final Widget nextPage;
  final Widget currentPage;
  final Corner corner = Corner.bottomLeft;
  final Duration animationDuration = const Duration(milliseconds: 500);

  CornerPageRoute(
      {required this.nextPage,
      required this.currentPage,
      corner = Corner.bottomLeft,
      animationDuration = const Duration(milliseconds: 500)})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => nextPage,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final Offset initialOffset;
            if (corner == Corner.topLeft) {
              initialOffset = const Offset(-1.0, -1.0);
            } else if (corner == Corner.topRight) {
              initialOffset = const Offset(1.0, -1.0);
            } else if (corner == Corner.bottomLeft) {
              initialOffset = const Offset(-1.0, 1.0);
            } else {
              initialOffset = const Offset(1.0, 1.0);
            }

            return SlideTransition(
              position: Tween<Offset>(
                begin: initialOffset,
                end: const Offset(0.0, 0.0),
              ).animate(animation),
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
                child: child,
              ),
            );
          },
          transitionDuration: animationDuration,
        );
}
