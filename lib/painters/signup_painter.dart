import 'package:flutter/material.dart';

class SignUpPainter extends CustomPainter{
  @override
  void paint(Canvas canvas,Size size){
    var paint = Paint();
    paint.color = Colors.purple.shade400;
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.lineTo(0, size.height*.5);
    path.quadraticBezierTo(size.width*.25, size.height*.375, size.width*.5, size.height*.4);
    path.quadraticBezierTo(size.width*.75, size.height*.45, size.width, size.height*.3);
    path.lineTo(size.width,0);

    canvas.drawPath(path, paint);

  }
  @override
  bool shouldRepaint(SignUpPainter oldDelegate){
    return false;
  }
}