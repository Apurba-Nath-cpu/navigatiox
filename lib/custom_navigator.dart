import 'package:flutter/material.dart';
import 'package:navigatiox/transitions/fade_scale_transition.dart';
import 'package:navigatiox/transitions/flip_transition.dart';
import 'package:navigatiox/transitions/fly_in_transition.dart';
import 'package:navigatiox/transitions/split_transition.dart';
import 'package:navigatiox/transitions/swirl_transition.dart';
import 'package:navigatiox/transitions/slide_transitions.dart';
import 'package:navigatiox/transitions/rotate_transition.dart';
import 'package:navigatiox/transitions/corner_transition.dart';
import 'package:navigatiox/utils/animation_types.dart';
import 'package:navigatiox/utils/corner_types.dart';

/// A utility class that provides static methods for navigating between pages with custom transitions.
/// This class is used to encapsulate the logic for pushing pages with various transition animations,
/// making it easier to apply consistent transitions throughout the application.
class CustomNavigator {
  /// Pushes a new page onto the navigation stack with a swirl transition animation.
  ///
  /// The [nextPage] parameter is the widget that will be displayed on the new page.
  /// The [duration] parameter specifies the duration of the animation, with a default of 500 milliseconds.
  /// The [numHalfRotations] parameter specifies the number of half rotations the swirl animation should make, with a default of 1.
  /// The [forward] parameter determines the direction of the swirl animation, with `true` meaning the swirl goes outward and `false` meaning it goes inward.
  /// The [axis] parameter specifies the axis along which the swirl animation should occur, with a default of `Axis.vertical`.
  ///
  /// This method uses the [SwirlPageRoute] class to create the custom transition animation.
  static void pushSwirl({
    required BuildContext context,
    required Widget nextPage,
    Duration duration = const Duration(milliseconds: 500),
    int numHalfRotations = 1,
    bool forward = true,
    Axis axis = Axis.vertical,
  }) {
    Navigator.push(
      context,
      SwirlPageRoute(
        nextPage: nextPage,
        currentPage: context.widget,
        animationDuration: duration,
        numberOfHalfRotations: numHalfRotations,
        forward: forward,
        axis: axis,
      ),
    );
  }

  /// Pushes a new page onto the navigation stack with a slide transition animation.
  ///
  /// The [nextPage] parameter is the widget that will be displayed on the new page.
  /// The [direction] parameter specifies the direction of the slide animation, with a default of `AxisDirection.left`.
  /// The [duration] parameter specifies the duration of the animation, with a default of 500 milliseconds.
  ///
  /// This method uses the [SlidePageRoute] class to create the custom transition animation.
  static void pushSlide({
    required BuildContext context,
    required Widget nextPage,
    AxisDirection direction = AxisDirection.left,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    Navigator.push(
      context,
      SlidePageRoute(
        nextPage: nextPage,
        currentPage: context.widget,
        animationDuration: duration,
        direction: direction,
      ),
    );
  }

  /// Pushes a new page onto the navigation stack with a fade and scale transition animation.
  ///
  /// The [nextPage] parameter is the widget that will be displayed on the new page.
  /// The [duration] parameter specifies the duration of the animation, with a default of 500 milliseconds.
  /// The [initialScale] parameter specifies the initial scale of the page being pushed, with a default of 0.0.
  ///
  /// This method uses the [FadeScalePageRoute] class to create the custom transition animation.
  static void pushFadeScale({
    required BuildContext context,
    required Widget nextPage,
    Duration duration = const Duration(milliseconds: 500),
    double initialScale = 0.0,
  }) {
    Navigator.push(
      context,
      FadeScalePageRoute(
        nextPage: nextPage,
        currentPage: context.widget,
        animationDuration: duration,
        initialScale: initialScale,
      ),
    );
  }

  /// Pushes a new page onto the navigation stack with a corner transition animation.
  ///
  /// The [nextPage] parameter is the widget that will be displayed on the new page.
  /// The [corner] parameter specifies the corner of the screen where the new page will appear, with a default of `Corner.bottomLeft`.
  /// The [duration] parameter specifies the duration of the animation, with a default of 500 milliseconds.
  ///
  /// This method uses the [CornerPageRoute] class to create the custom transition animation.
  static void pushCorner({
    required BuildContext context,
    Corner corner = Corner.bottomLeft,
    required Widget nextPage,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    Navigator.push(
      context,
      CornerPageRoute(
        nextPage: nextPage,
        currentPage: context.widget,
        animationDuration: duration,
        corner: corner,
      ),
    );
  }

  /// Pushes a new page onto the navigation stack with a rotate transition animation.
  ///
  /// The [nextPage] parameter is the widget that will be displayed on the new page.
  /// The [duration] parameter specifies the duration of the animation, with a default of 500 milliseconds.
  /// The [numberOfTurns] parameter specifies the number of half rotations the animation will make, with a default of 1.
  /// The [clockwise] parameter specifies the direction of rotation, with `true` meaning clockwise and `false` meaning counterclockwise.
  ///
  /// This method uses the [RotatePageRoute] class to create the custom transition animation.
  static void pushRotate({
    required BuildContext context,
    required Widget nextPage,
    Duration duration = const Duration(milliseconds: 500),
    int numberOfTurns = 1,
    bool clockwise = true,
  }) {
    Navigator.push(
      context,
      RotatePageRoute(
        nextPage: nextPage,
        currentPage: context.widget,
        animationDuration: duration,
        numberOfRotations: numberOfTurns,
        clockwise: clockwise,
      ),
    );
  }

  /// Pushes a new page onto the navigation stack with a flip transition animation.
  ///
  /// The [nextPage] parameter is the widget that will be displayed on the new page.
  /// The [duration] parameter specifies the duration of the animation, with a default of 500 milliseconds.
  /// The [axis] parameter specifies the axis along which the flip animation should occur, with a default of [AxisDirection.left].
  /// The [fadeIn] parameter determines whether the next page should fade in or not, with a default of `true`.
  /// The [forward] parameter determines whether the flip animation should go from left to right (`true`) or right to left (`false`), with a default of `false`.
  ///
  /// This method uses the [FlipPageRoute] class to create the custom transition animation.
  static void pushFlip({
    required BuildContext context,
    required Widget nextPage,
    Duration duration = const Duration(milliseconds: 500),
    AxisDirection axis = AxisDirection.left,
    bool fadeIn = true,
    bool forward = false,
  }) {
    Navigator.push(
      context,
      FlipPageRoute(
        nextPage: nextPage,
        currentPage: context.widget,
        animationDuration: duration,
        axis: axis,
        fadeIn: fadeIn,
        forward: forward,
      ),
    );
  }

  /// Pushes a new page onto the navigation stack with a fly-in transition animation.
  ///
  /// The [nextPage] parameter is the widget that will be displayed on the new page.
  /// The [duration] parameter specifies the duration of the animation, with a default of 500 milliseconds.
  /// The [axis] parameter specifies the axis along which the fly-in animation should occur, with a default of [AxisDirection.left].
  /// The [inclination] parameter specifies the axis along which the fly-in animation should be inclined, with a default of [AxisDirection.up].
  /// The [fadeIn] parameter determines whether the next page should fade in or not, with a default of `true`.
  /// The [forward] parameter determines whether the fly-in animation should go from left to right (`true`) or right to left (`false`), with a default of `false`.
  ///
  /// This method uses the [FlyInPageRoute] class to create the custom transition animation.
  static void pushFlyin({
    required BuildContext context,
    required Widget nextPage,
    Duration duration = const Duration(milliseconds: 500),
    AxisDirection axis = AxisDirection.left,
    AxisDirection inclination = AxisDirection.up,
    bool fadeIn = true,
    bool forward = false,
  }) {
    Navigator.push(
      context,
      FlyInPageRoute(
        nextPage: nextPage,
        currentPage: context.widget,
        animationDuration: duration,
        axis: axis,
        inclination: inclination,
        fadeIn: fadeIn,
        forward: forward,
      ),
    );
  }

  static void push(ParentAnimation animation) {
    switch (animation) {
      case FadeScaleAnimation anim:
        Navigator.push(
          anim.context,
          FadeScalePageRoute(
            nextPage: anim.nextPage,
            currentPage: anim.context.widget,
            initialScale: anim.initialScale,
            animationDuration: anim.duration,
          ),
        );
        break;

      case FlipAnimation anim:
        Navigator.push(
          anim.context,
          FlipPageRoute(
            nextPage: anim.nextPage,
            currentPage: anim.context.widget,
            animationDuration: anim.duration,
            axis: anim.axis,
            fadeIn: anim.fadeIn,
            forward: anim.forward,
          ),
        );
        break;

      case FlyInAnimation anim:
        Navigator.push(
          anim.context,
          FlyInPageRoute(
            nextPage: animation.nextPage,
            currentPage: animation.context.widget,
            animationDuration: animation.duration,
            axis: anim.axis,
            inclination: anim.inclination,
            fadeIn: anim.fadeIn,
            forward: anim.forward,
          ),
        );
        break;

      case SlideAnimation anim:
        Navigator.push(
          anim.context,
          SlidePageRoute(
            nextPage: anim.nextPage,
            currentPage: anim.context.widget,
            animationDuration: anim.duration,
            direction: anim.direction,
          ),
        );
        break;

      case RotateAnimation anim:
        Navigator.push(
          anim.context,
          RotatePageRoute(
            nextPage: anim.nextPage,
            currentPage: anim.context.widget,
            animationDuration: anim.duration,
            numberOfRotations: anim.numberOfRotations,
            clockwise: anim.clockwise,
          ),
        );
        break;

      case SwirlAnimation anim:
        Navigator.push(
          anim.context,
          SwirlPageRoute(
            nextPage: anim.nextPage,
            currentPage: anim.context.widget,
            animationDuration: anim.duration,
            numberOfHalfRotations: anim.numberOfHalfRotations,
            forward: anim.forward,
            axis: anim.axis,
          ),
        );
        break;

      case CornerAnimation anim:
        Navigator.push(
          anim.context,
          CornerPageRoute(
            nextPage: anim.nextPage,
            currentPage: anim.context.widget,
            animationDuration: anim.duration,
            corner: anim.corner,
          ),
        );
        break;
    }
  }
  
  static void pushReplacement(ParentAnimation animation) {
    switch (animation) {
      case FadeScaleAnimation anim:
        Navigator.pushReplacement(
          anim.context,
          FadeScalePageRoute(
            nextPage: anim.nextPage,
            currentPage: anim.context.widget,
            initialScale: anim.initialScale,
            animationDuration: anim.duration,
          ),
        );
        break;

      case FlipAnimation anim:
        Navigator.pushReplacement(
          anim.context,
          FlipPageRoute(
            nextPage: anim.nextPage,
            currentPage: anim.context.widget,
            animationDuration: anim.duration,
            axis: anim.axis,
            fadeIn: anim.fadeIn,
            forward: anim.forward,
          ),
        );
        break;

      case FlyInAnimation anim:
        Navigator.pushReplacement(
          anim.context,
          FlyInPageRoute(
            nextPage: animation.nextPage,
            currentPage: animation.context.widget,
            animationDuration: animation.duration,
            axis: anim.axis,
            inclination: anim.inclination,
            fadeIn: anim.fadeIn,
            forward: anim.forward,
          ),
        );
        break;

      case SlideAnimation anim:
        Navigator.pushReplacement(
          anim.context,
          SlidePageRoute(
            nextPage: anim.nextPage,
            currentPage: anim.context.widget,
            animationDuration: anim.duration,
            direction: anim.direction,
          ),
        );
        break;

      case RotateAnimation anim:
        Navigator.pushReplacement(
          anim.context,
          RotatePageRoute(
            nextPage: anim.nextPage,
            currentPage: anim.context.widget,
            animationDuration: anim.duration,
            numberOfRotations: anim.numberOfRotations,
            clockwise: anim.clockwise,
          ),
        );
        break;

      case SwirlAnimation anim:
        Navigator.pushReplacement(
          anim.context,
          SwirlPageRoute(
            nextPage: anim.nextPage,
            currentPage: anim.context.widget,
            animationDuration: anim.duration,
            numberOfHalfRotations: anim.numberOfHalfRotations,
            forward: anim.forward,
            axis: anim.axis,
          ),
        );
        break;

      case CornerAnimation anim:
        Navigator.pushReplacement(
          anim.context,
          CornerPageRoute(
            nextPage: anim.nextPage,
            currentPage: anim.context.widget,
            animationDuration: anim.duration,
            corner: anim.corner,
          ),
        );
        break;
    }
  }

  static void pushAndRemoveUntil(ParentAnimation animation, bool Function(Route<dynamic>) predicate) {
    switch (animation) {
      case FadeScaleAnimation anim:
        Navigator.pushAndRemoveUntil(
          anim.context,
          FadeScalePageRoute(
            nextPage: anim.nextPage,
            currentPage: anim.context.widget,
            initialScale: anim.initialScale,
            animationDuration: anim.duration,
          ),
          predicate,
        );
        break;

      case FlipAnimation anim:
        Navigator.pushAndRemoveUntil(
          anim.context,
          FlipPageRoute(
            nextPage: anim.nextPage,
            currentPage: anim.context.widget,
            animationDuration: anim.duration,
            axis: anim.axis,
            fadeIn: anim.fadeIn,
            forward: anim.forward,
          ),
          predicate,
        );
        break;

      case FlyInAnimation anim:
        Navigator.pushAndRemoveUntil(
          anim.context,
          FlyInPageRoute(
            nextPage: animation.nextPage,
            currentPage: animation.context.widget,
            animationDuration: animation.duration,
            axis: anim.axis,
            inclination: anim.inclination,
            fadeIn: anim.fadeIn,
            forward: anim.forward,
          ),
          predicate,
        );
        break;

      case SlideAnimation anim:
        Navigator.pushAndRemoveUntil(
          anim.context,
          SlidePageRoute(
            nextPage: anim.nextPage,
            currentPage: anim.context.widget,
            animationDuration: anim.duration,
            direction: anim.direction,
          ),
          predicate,
        );
        break;

      case RotateAnimation anim:
        Navigator.pushAndRemoveUntil(
          anim.context,
          RotatePageRoute(
            nextPage: anim.nextPage,
            currentPage: anim.context.widget,
            animationDuration: anim.duration,
            numberOfRotations: anim.numberOfRotations,
            clockwise: anim.clockwise,
          ),
          predicate,
        );
        break;

      case SwirlAnimation anim:
        Navigator.pushAndRemoveUntil(
          anim.context,
          SwirlPageRoute(
            nextPage: anim.nextPage,
            currentPage: anim.context.widget,
            animationDuration: anim.duration,
            numberOfHalfRotations: anim.numberOfHalfRotations,
            forward: anim.forward,
            axis: anim.axis,
          ),
          predicate,
        );
        break;

      case CornerAnimation anim:
        Navigator.pushAndRemoveUntil(
          anim.context,
          CornerPageRoute(
            nextPage: anim.nextPage,
            currentPage: anim.context.widget,
            animationDuration: anim.duration,
            corner: anim.corner,
          ),
          predicate,
        );
        break;
    }
  }
}
