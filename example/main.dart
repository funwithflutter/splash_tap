import 'package:flutter/material.dart';
import 'package:splash_tap/splash_tap.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Tap Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashTapDemo(),
    );
  }
}

class SplashTapDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Splash(
          onTap: () {},
          child: const Text(
            'Splash!',
            style: TextStyle(fontSize: 32),
          ),
        ),
      ),
    );
  }
}
