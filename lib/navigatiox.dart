library navigatiox;

import 'package:flutter/material.dart';

/// A custom [PageRoute] that allows for a custom transition builder.
///
/// This class extends [PageRouteBuilder] and allows you to provide a custom
/// [transition] function that will be used to animate the page transition.
/// The [page] parameter is the widget that will be displayed on the page.
class CustomPageRoute extends PageRouteBuilder {
  final Widget page;
  final RouteTransitionsBuilder transition;

  CustomPageRoute({required this.page, required this.transition})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: transition,
        );
}
