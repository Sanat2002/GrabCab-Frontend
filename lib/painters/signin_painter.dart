import 'package:flutter/material.dart';

class SignInPainter extends CustomPainter{
  @override
  void paint(Canvas canvas,Size size){
    var paint = Paint();
    paint.color = Colors.purple.shade300;
    paint.style = PaintingStyle.fill;

    var path = Path();
    
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(SignInPainter oldDelegate){
    return false;
  }
}