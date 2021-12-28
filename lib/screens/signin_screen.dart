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
                top: 37,
                left:0,
                right:0,
                child: Column(
                  children: [
                    "To get best cars at best values,".text.textStyle(TextStyle(fontSize: 25,fontFamily: GoogleFonts.arsenal().fontFamily)).make(),
                    "Sign In!!!".text.purple600.semiBold.textStyle(TextStyle(fontSize: 30,fontFamily: GoogleFonts.arsenal().fontFamily)).make(),
                  ],
                )
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                child: Lottie.asset("assets/signin_ani.json"))
            ],
          ),
        ),
      ),
      
    );
  }
}