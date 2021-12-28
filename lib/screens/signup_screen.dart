import 'package:flutter/material.dart';
import 'package:grabcab/painters/signup_painter.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: CustomPaint(
                painter: SignUpPainter(),
              ),
            )),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Lottie.asset("assets/signup_ani.json",height: 250))
        ],
      ),
    );
  }
}