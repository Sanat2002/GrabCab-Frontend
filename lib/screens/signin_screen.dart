// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grabcab/painters/signin_painter.dart';
import 'package:grabcab/screens/home_screen.dart';
import 'package:grabcab/services/authentication.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:email_validator/email_validator.dart';
import 'dart:async';

class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool _visible = false;
  bool _isloading = false;
  final _auth = FirebaseAuth.instance;

  final _formkey = GlobalKey<FormState>();
  late Timer timer;

  final _emailcontroller = TextEditingController();
  final _passcontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return _isloading? Scaffold(body: Center(child: CircularProgressIndicator(color: Colors.purple.shade300,)),) : Scaffold(
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
                    "To get best cars at best values,".text.textStyle(TextStyle(fontSize: 30,fontFamily: GoogleFonts.arsenal().fontFamily)).make(),
                    16.heightBox,
                    "Sign In!!!".text.purple600.semiBold.textStyle(TextStyle(fontSize: 33,fontFamily: GoogleFonts.arsenal().fontFamily)).make(),
                  ],
                )
              ),
              Positioned(
                top: 180,
                left: 40,
                right: 40,
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Container(
                        height: size.height*.076,
                        decoration: BoxDecoration(
                          color: Colors.purple.shade200,
                          borderRadius: BorderRadius.circular(40)
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailcontroller,
                          validator: (value){
                            if(!EmailValidator.validate(value!)){
                              return "Enter correct email !!!";
                            }
                            return null;
                          },
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
                            errorStyle:TextStyle(color: Colors.white),
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
                        ).px(5).py(3),
                      ),
                      25.heightBox,
                      Container(
                        height: size.height*.076,
                        decoration: BoxDecoration(
                          color: Colors.purple.shade200,
                          borderRadius: BorderRadius.circular(40)
                        ),
                        child: TextFormField(
                          controller: _passcontroller,
                          validator: (value){
                            if(value!.length<6){
                              return "Password length must be greater than 6";
                            }
                            return null;
                          },
                          obscureText:_visible? false:true,
                          cursorColor: Colors.white,
                          cursorHeight: 24,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock,color:Colors.white,size:28),
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
                            errorStyle: TextStyle(color: Colors.white),
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
                        ).px(5).py(3),
                      ),
                      50.heightBox,
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.purple.shade400),
                          shape: MaterialStateProperty.all(StadiumBorder())
                        ),
                        onPressed: () async{
                          if(_formkey.currentState!.validate()){
                            setState(() {
                              _isloading = true;
                            });
                            var res = await AuthenticationService().signinemail(_emailcontroller.text, _passcontroller.text);

                            if(res == "Success"){
                              if(_auth.currentUser!.emailVerified){
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home()), (route) => false);
                              }
                              else{
                                await AuthenticationService().signout();
                                res = "Email not verified!!!";
                              }
                            }
                            setState(() {
                              _isloading = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: res.text.red400.make()));
                          }
                        }, 
                        child: "Sign In".text.xl2.make()
                      ).wh(size.width*.3, size.height*.05)
                    ],
                  ),
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