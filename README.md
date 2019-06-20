
Makes an interesting splash effect when tapping its child widget.  
  
## Getting Started  
  
To use this plugin, add `splash_tap` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).  
  
The color can be set with the **splashColor** property. The splash size is dependent on the size of the child widget passed in - which is constrained by the **minRadius** and **maxRadius** parameters.
  
### Example  
  
```dart  
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
          child: Text(  
            'Splash!',  
            style: TextStyle(fontSize: 32),  
          ),  
        ),  
      ),  
    );  
  }  
}  
```