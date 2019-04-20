import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  final Widget child;
  final GestureTapCallback onTap;

  const Splash({Key key, this.onTap, this.child}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  static const double minRadius = 50;
  static const double maxRadius = 120;

  AnimationController controller;
  Tween<double> radiusTween;
  Tween<double> borderWidthTween;
  Animation<double> radiusAnimation;
  Animation<double> borderWidthAnimation;
  AnimationStatus status;
  Offset _tapPosition;

  @override
  void initState() {
    controller =
    AnimationController(vsync: this, duration: Duration(milliseconds: 350))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((listener) {
        status = listener;
      });
    radiusTween = Tween<double>(begin: 0, end: 50);
    radiusAnimation = radiusTween
        .animate(CurvedAnimation(curve: Curves.ease, parent: controller));
    borderWidthTween = Tween<double>(begin: 25, end: 1);
    borderWidthAnimation = borderWidthTween.animate(
        CurvedAnimation(curve: Curves.fastOutSlowIn, parent: controller));

    super.initState();
  }

  void _animate() {
    controller.forward(from: 0);
  }

  void _handleTap(TapUpDetails tapDetails) {
    RenderBox renderBox = context.findRenderObject();
    _tapPosition = renderBox.globalToLocal(tapDetails.globalPosition);
    double radius = (renderBox.size.width > renderBox.size.height)
        ? renderBox.size.width
        : renderBox.size.height;

    double constraintRadius;
    if (radius > maxRadius) {
      constraintRadius = maxRadius;
    } else if (radius < minRadius) {
      constraintRadius = minRadius;
    } else {
      constraintRadius = radius;
    }

    radiusTween.end = constraintRadius * 0.6;
    borderWidthTween.begin = radiusTween.end / 2;
    borderWidthTween.end = radiusTween.end * 0.01;
    _animate();

    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: SplashPaint(
        radius: radiusAnimation.value,
        borderWidth: borderWidthAnimation.value,
        status: status,
        tapPosition: _tapPosition,
      ),
      child: GestureDetector(
        child: widget.child,
        onTapUp: _handleTap,
      ),
    );
  }
}

class SplashPaint extends CustomPainter {
  final double radius;
  final double borderWidth;
  final AnimationStatus status;
  final Offset tapPosition;
  final Paint blackPaint;

  SplashPaint({
    @required this.radius,
    @required this.borderWidth,
    @required this.status,
    @required this.tapPosition,
  }) : blackPaint = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.stroke
    ..strokeWidth = borderWidth;

  @override
  void paint(Canvas canvas, Size size) {
    if (status == AnimationStatus.forward) {
      canvas.drawCircle(tapPosition, radius, blackPaint);
    }
  }

  @override
  bool shouldRepaint(SplashPaint oldDelegate) {
    if (radius != oldDelegate.radius) {
      return true;
    } else {
      return false;
    }
  }
}