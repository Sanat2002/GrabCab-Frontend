// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grabcab/painters/signup_painter.dart';
import 'package:grabcab/screens/signin_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool visible = false;

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
                          fontSize: 18,
                        ),
                        cursorColor: Colors.white,
                        cursorRadius: Radius.circular(10),
                        cursorHeight: 25,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person,color: Colors.white,size: 30,),
                          hintText: "Username",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        ),
                      ).px(4),
                    ),
                    15.heightBox,
                    Container(
                      decoration: BoxDecoration(
                        color:Colors.purple.shade400,
                        borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        cursorColor: Colors.white,
                        cursorRadius: Radius.circular(10),
                        cursorHeight: 25,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail,color: Colors.white,size: 28,),
                          hintText: "Email address",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        ),
                      ).px(4),
                    ),
                    15.heightBox,
                    Container(
                      decoration: BoxDecoration(
                        color:Colors.purple.shade400,
                        borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                      child: TextFormField(
                        obscureText:visible?false:true,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        cursorColor: Colors.white,
                        cursorRadius: Radius.circular(10),
                        cursorHeight: 25,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock,color: Colors.white,size: 30,),
                          suffixIcon: visible? Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: IconButton(
                              onPressed: (){
                                setState(() {
                                  visible = false;
                                });
                            }, icon: Icon(Icons.visibility,color:Colors.white,)),
                          ) : Padding(padding:EdgeInsets.only(right: 10),child: IconButton(
                            onPressed: (){
                              setState(() {
                                visible = true;
                              });
                            },
                            icon: Icon(Icons.visibility_off,color:Colors.white,))),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        ),
                      ).px(4),
                    ),
                    30.heightBox,
                    ElevatedButton(
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)),
                        backgroundColor: MaterialStateProperty.all(Colors.purple.shade600),
                        shape:MaterialStateProperty.all(StadiumBorder())
                      ),
                      onPressed: (){

                      }, 
                      child: "Sign Up".text.make()
                    ).wh(size.width*.35, size.height*.055),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(bottom: 7),
        child: SizedBox(
          height: size.height*.045,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              "Already have an account?".text.xl2.make(),
              TextButton(
                style: ButtonStyle(
                  splashFactory:NoSplash.splashFactory,
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                }, 
                child: "Sign in".text.purple700.xl2.make())
            ],
          )
        ),
      ),
    );
  }
}