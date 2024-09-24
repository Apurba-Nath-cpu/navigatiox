import 'package:example/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:navigatiox/custom_navigator.dart';
import 'package:navigatiox/utils/corner_type.dart';

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
                CustomNavigator.pushSwirl(
                  context: context,
                  nextPage: const SecondScreen(),
                  duration: const Duration(milliseconds: 500),
                  numHalfRotations: 2,
                  forward: true,
                  axis: Axis.horizontal,
                );
              },
              child: const Text('Swirl Transition'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomNavigator.pushSlide(
                  context: context,
                  nextPage: const SecondScreen(),
                  direction: AxisDirection.down,
                );
              },
              child: const Text('Slide Transition'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomNavigator.pushFadeScale(
                  context: context,
                  nextPage: const SecondScreen(),
                  duration: const Duration(milliseconds: 500),
                );
              },
              child: const Text('Fade & Scale Transition'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomNavigator.pushCorner(
                  context: context,
                  nextPage: const SecondScreen(),
                  duration: const Duration(milliseconds: 500),
                  corner: Corner.bottomLeft,
                );
              },
              child: const Text('Corner Transition'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomNavigator.pushRotate(
                  context: context,
                  nextPage: const SecondScreen(),
                  duration: const Duration(milliseconds: 500),
                  clockwise: true,
                  numberOfTurns: 1,
                );
              },
              child: const Text('Rotate Transition'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomNavigator.pushFlip(
                  context: context,
                  nextPage: const SecondScreen(),
                  duration: const Duration(milliseconds: 500),
                  axis: AxisDirection.left,
                  fadeIn: true,
                  forward: false,
                );
              },
              child: const Text('Flip Transition'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomNavigator.pushFlyin(
                  context: context,
                  nextPage: const SecondScreen(),
                  duration: const Duration(milliseconds: 500),
                  axis: AxisDirection.up,
                  inclination: AxisDirection.left,
                  fadeIn: true,
                  forward: true,
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
