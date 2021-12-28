import 'package:flutter/material.dart';

class SignInPainter extends CustomPainter{
  @override
  void paint(Canvas canvas,Size size){
    var paint = Paint();
    paint.color = Colors.purple.shade300;
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height*.7);
    path.quadraticBezierTo(size.width*.25, size.height*.6, size.width*.54, size.height*.65);
    path.quadraticBezierTo(size.width*.8, size.height*.7, size.width, size.height*.45);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(SignInPainter oldDelegate){
    return false;
  }
}