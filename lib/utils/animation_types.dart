import 'package:flutter/material.dart';
import 'package:navigatiox/utils/corner_types.dart';

// ParentAnimation class defining the common properties of all animations (duration of animation, buildContext, and next page Widget)
abstract class ParentAnimation {
  final Duration duration;
  final BuildContext context;
  final Widget nextPage;

  const ParentAnimation(
      {required this.context,
      required this.nextPage,
      this.duration = const Duration(milliseconds: 500)});
}

// FadeScaleAnimation class implementing ParentAnimation with FadeScale Transition
class FadeScaleAnimation extends ParentAnimation {
  final double initialScale;
  const FadeScaleAnimation(
      {required super.context,
      required super.nextPage,
      super.duration,
      this.initialScale = 0.0});
}

// FlipAnimation class implementing ParentAnimation with Flip Transition
class FlipAnimation extends ParentAnimation {
  final AxisDirection axis;
  final bool fadeIn;
  final bool forward;
  const FlipAnimation({
    required super.context,
    required super.nextPage,
    super.duration,
    this.axis = AxisDirection.left,
    this.fadeIn = true,
    this.forward = false,
  });
}

// FlyInAnimation class implementing ParentAnimation with FlyIn Transition
class FlyInAnimation extends ParentAnimation {
  final AxisDirection axis;
  final AxisDirection inclination;
  final bool fadeIn;
  final bool forward;
  const FlyInAnimation({
    required super.context,
    required super.nextPage,
    super.duration,
    this.axis = AxisDirection.left,
    this.inclination = AxisDirection.up,
    this.fadeIn = true,
    this.forward = false,
  });
}

// SlideAnimation class implementing ParentAnimation with Slide Transition
class SlideAnimation extends ParentAnimation {
  final AxisDirection direction;
  const SlideAnimation({
    required super.context,
    required super.nextPage,
    super.duration,
    this.direction = AxisDirection.left,
  });
}

// RotateAnimation class implementing ParentAnimation with Rotate Transition
class RotateAnimation extends ParentAnimation {
  final int numberOfRotations;
  final bool clockwise;
  const RotateAnimation({
    required super.context,
    required super.nextPage,
    super.duration,
    this.numberOfRotations = 1,
    this.clockwise = true,
  });
}

// SwirlAnimation class implementing ParentAnimation with Swirl Transition
class SwirlAnimation extends ParentAnimation {
  final int numberOfHalfRotations;
  final bool forward;
  final Axis axis;
  const SwirlAnimation({
    required super.context,
    required super.nextPage,
    super.duration,
    this.numberOfHalfRotations = 1,
    this.forward = true,
    this.axis = Axis.vertical,
  });
}

// CornerAnimation class implementing ParentAnimation with Corner Transition
class CornerAnimation extends ParentAnimation {
  final Corner corner;
  const CornerAnimation({
    required super.context,
    required super.nextPage,
    super.duration,
    this.corner = Corner.bottomLeft,
  });
}
