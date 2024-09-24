# Navigatiox

A Flutter package that provides a collection of custom page transition animations to enhance the navigation experience in your Flutter applications. This package includes various transitions such as flip, slide, rotate, and more, allowing developers to create visually appealing navigation flows.

## Features

- ***Wide array of animations**: Choose which animation suits your app's design.
- **Customizable**: Control animation duration, direction, and starting positions.
- **Lightweight**: Designed to be easy to integrate into existing Flutter applications.

## Installation

To use this package, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  navigatiox: ^0.1.0 # Replace with the latest version
```

Then, run the following command to install the package:

flutter pub get

## Usage

To use the package, simply import it in your Dart code:

```dart
import 'package:navigatiox/navigatiox.dart';
```

Here's how to use the Rotate animation for page navigation:

```dart
CustomNavigator.pushRotate(
  context: context,
  nextPage: const SecondScreen(),
  duration: const Duration(milliseconds: 500),
  clockwise: true,
  numberOfTurns: 1,
);
```

## Contributing

Contributions are welcome!