// ignore_for_file: prefer_const_constructors

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

  bool _visible = false;

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
                top: 160,
                left: 40,
                right: 40,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.purple.shade200,
                        borderRadius: BorderRadius.circular(40)
                      ),
                      child: TextFormField(
                        cursorColor: Colors.white,
                        cursorHeight: 24,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail_rounded,color:Colors.white,size:28),
                          hintText: "Email address",
                          hintStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent
                            )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent
                            )
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent
                            )
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent
                            )
                          ),
                        ),
                      ).px(5),
                    ),
                    30.heightBox,
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.purple.shade200,
                        borderRadius: BorderRadius.circular(40)
                      ),
                      child: TextFormField(
                        obscureText:_visible? false:true,
                        cursorColor: Colors.white,
                        cursorHeight: 24,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail_rounded,color:Colors.white,size:28),
                          suffixIcon: _visible? Padding(
                            padding: EdgeInsets.only(right:4),
                            child: IconButton(
                              splashRadius: 1,
                              onPressed: (){
                                setState(() {
                                  _visible = false;
                                });
                              }, icon: Icon(Icons.visibility,color:Colors.white,size:25)),
                          ) : Padding(
                            padding: EdgeInsets.only(right:4),
                            child: IconButton(
                              splashRadius: 1,
                              onPressed: (){
                                setState(() {
                                  _visible = true;
                                });
                              }, icon: Icon(Icons.visibility_off,color:Colors.white,size:25)),
                          )  ,
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent
                            )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent
                            )
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent
                            )
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent
                            )
                          ),
                        ),
                      ).px(5),
                    )
                  ],
                )),
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