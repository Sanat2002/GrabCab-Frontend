// ignore_for_file: prefer_const_constructors

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
                    "Cab".text.purple500.extraBold.textStyle(TextStyle(fontSize: 30,fontFamily:GoogleFonts.arsenal().fontFamily)).make(),
                    "!!!".text.textStyle(TextStyle(fontSize: 30,fontFamily:GoogleFonts.arsenal().fontFamily)).make(),
                  ],
                ),
              ),
              Positioned(
                top:size.height*.52,
                left: 40,
                right: 40,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color:Colors.purple.shade400,
                        borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        cursorColor: Colors.black,
                        cursorRadius: Radius.circular(10),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person,color: Colors.white,),
                          hintText: "Jhonny Depp",
                          label: "Username".text.white.make(),
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent))
                        ),
                        
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