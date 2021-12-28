import 'package:flutter/material.dart';
import 'package:grabcab/painters/signin_painter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                top:0,
                left:0,
                right:0,
                bottom: 0,
                child: CustomPaint(
                  painter: SignInPainter(),
                )
              ),
              Positioned(
                top: 30,
                left:0,
                right:0,
                child: "Sign In to get best car at best value!!!".text.make())
            ],
          ),
        ),
      ),
      
    );
  }
}