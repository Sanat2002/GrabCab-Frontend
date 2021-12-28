import 'package:flutter/material.dart';
import 'package:grabcab/painters/signup_painter.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
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
                )
              ),
              Positioned(
                top: 50,
                left: 0,
                right: 0,
                child: Lottie.asset("assets/signup_ani.json",height: 250)
              ),
              Positioned(
                top: size.height*.45,
                left: size.width*.15,
                child: Row(
                  children: [
                    "Welcome to Grab".text.textStyle(TextStyle(fontSize: 30,fontFamily:GoogleFonts.arsenal().fontFamily)).make(),
                    "Cab".text.blue700.extraBold.textStyle(TextStyle(fontSize: 30,fontFamily:GoogleFonts.arsenal().fontFamily)).make(),
                    "!!!".text.textStyle(TextStyle(fontSize: 30,fontFamily:GoogleFonts.arsenal().fontFamily)).make(),
                  ],
                ),
              ),
              Positioned(
                top:size.height*.5,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "helo",
                        label: "le".text.make()
                      ),
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}