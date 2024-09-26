import 'package:example/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:navigatiox/custom_navigator.dart';
import 'package:navigatiox/utils/animation_types.dart';
import 'package:navigatiox/utils/corner_types.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                CustomNavigator.push(
                  SwirlAnimation(
                    context: context,
                    nextPage: const SecondScreen(),
                    duration: const Duration(milliseconds: 500),
                    numberOfHalfRotations: 2,
                    forward: true,
                    axis: Axis.horizontal,
                  ),
                );
              },
              child: const Text('Swirl Transition'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomNavigator.push(
                  SlideAnimation(
                    context: context,
                    nextPage: const SecondScreen(),
                    duration: const Duration(milliseconds: 500),
                    direction: AxisDirection.left,
                  ),
                );
              },
              child: const Text('Slide Transition'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomNavigator.push(
                  FadeScaleAnimation(
                    context: context,
                    nextPage: const SecondScreen(),
                    duration: const Duration(milliseconds: 500),
                    initialScale: 0.0,
                  ),
                );
              },
              child: const Text('Fade & Scale Transition'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomNavigator.push(
                  CornerAnimation(
                    context: context,
                    nextPage: const SecondScreen(),
                    duration: const Duration(milliseconds: 500),
                    corner: Corner.bottomLeft,
                  ),
                );
              },
              child: const Text('Corner Transition'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomNavigator.push(
                  RotateAnimation(
                    context: context,
                    nextPage: const SecondScreen(),
                    duration: const Duration(milliseconds: 500),
                    numberOfRotations: 1,
                    clockwise: true,
                  ),
                );
              },
              child: const Text('Rotate Transition'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomNavigator.push(
                  FlipAnimation(
                    context: context,
                    nextPage: const SecondScreen(),
                    duration: const Duration(milliseconds: 500),
                    axis: AxisDirection.left,
                    fadeIn: true,
                    forward: false,
                  ),
                );
              },
              child: const Text('Flip Transition'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomNavigator.push(
                  FlyInAnimation(
                    context: context,
                    nextPage: const SecondScreen(),
                    duration: const Duration(milliseconds: 500),
                    axis: AxisDirection.left,
                    inclination: AxisDirection.up,
                    fadeIn: true,
                    forward: false,
                  ),
                );
              },
              child: const Text('FlyIn Transition'),
            ),
          ],
        ),
      ),
    );
  }
}
