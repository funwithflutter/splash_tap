# splash_tap

Makes a nice splash effect when tapping its child widget.

## Getting Started

To use this plugin, add `splash_tap` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

### Example

```dart
import 'package:flutter/material.dart';
import 'package:splash_tap/splash_tap.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Splash(
          child: Text(
            'Click!',
            style: TextStyle(fontSize: 32),
          ),
        ),
      ),
    ),
  ));
}
```
