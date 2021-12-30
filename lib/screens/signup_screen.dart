// ignore_for_file: prefer_const_constructors

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grabcab/painters/signup_painter.dart';
import 'package:grabcab/screens/home_screen.dart';
import 'package:grabcab/screens/signin_screen.dart';
import 'package:grabcab/services/authentication.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool _visible = false;
  bool _isloading = false;
  late Timer timer;
  final _auth = FirebaseAuth.instance;

  final _formkey = GlobalKey<FormState>();

  final _namecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passcontroller = TextEditingController();

  infunct(){
    timer = Timer.periodic(Duration(seconds: 3), (timer) { 
      verifymail();
    });
  }

  verifymail() async{
    await _auth.currentUser!.reload();
    if(_auth.currentUser!.emailVerified){
      timer.cancel();
      Navigator.pushAndRemoveUntil(context, PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child){
          return ScaleTransition(
            alignment: Alignment.bottomLeft,
            child:child,
            scale: animation,);
        },
        pageBuilder: (BuildContext context,Animation<double> animation,Animation<double> secanimation){
          return Home();
        }) , (route) => false);
    }
  }

  verifydialog(BuildContext context){
    Size size = MediaQuery.of(context).size;
    infunct();

   showDialog(context: context, 
    builder: (context){
      return AlertDialog(
        backgroundColor: Colors.white,
        content: SizedBox(
          height: size.height*.39,
          width: size.width*.9,
          child: Column(
            children: [
              "Email Verification...".text.textStyle(TextStyle(fontSize: size.height*.04,fontWeight: FontWeight.bold,fontFamily: GoogleFonts.abel().fontFamily)).make(),
              Divider(color: Colors.black,),
              Lottie.asset("assets/verifymail_ani.json",height:200),
              "Verification link has been sent to,".text.xl.make(),
              _emailcontroller.text.text.blue500.textStyle(TextStyle(fontSize:20)).make()
            ],
          ),
        ),
      );
    }).then((value) => timer.cancel()); // this .then() will work when the dialog is dispossed
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return _isloading? Scaffold(body: Center(child: CircularProgressIndicator(color:Colors.purple.shade400))): Scaffold(
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
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Container(
                        height: size.height*.076,
                        decoration: BoxDecoration(
                          color:Colors.purple.shade300,
                          borderRadius: BorderRadius.all(Radius.circular(50))
                        ),
                        child: TextFormField(
                          controller: _namecontroller,
                          validator:(value){
                            if(value!.isEmpty){
                              return "Enter username";
                            }
                            return null;
                          },
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
                            errorStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)),
                          ),
                        ).px(4).py(3),
                      ),
                      15.heightBox,
                      Container(
                        height: size.height*.076,
                        decoration: BoxDecoration(
                          color:Colors.purple.shade300,
                          borderRadius: BorderRadius.all(Radius.circular(50))
                        ),
                        child: TextFormField(
                          controller:_emailcontroller,
                          validator: (value){
                            if(!EmailValidator.validate(value!)){
                              return "Enter correct email !!!";
                            }
                            return null;
                          },
                          keyboardType:TextInputType.emailAddress,
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
                            errorStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)),
                          ),
                        ).px(4).py(3),
                      ),
                      15.heightBox,
                      Container(
                        height: size.height*.07,
                        decoration: BoxDecoration(
                          color:Colors.purple.shade300,
                          borderRadius: BorderRadius.all(Radius.circular(50))
                        ),
                        child: TextFormField(
                          controller: _passcontroller,
                          validator:(value){
                            if(value!.length<6){
                              return "Password length must be greater than 6";
                            }
                            return null;
                          },
                          obscureText:_visible?false:true,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          cursorColor: Colors.white,
                          cursorRadius: Radius.circular(10),
                          cursorHeight: 25,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock,color: Colors.white,size: 30,),
                            suffixIcon: _visible? Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: IconButton(
                                splashRadius: 1,
                                onPressed: (){
                                  setState(() {
                                    _visible = false;
                                  });
                              }, icon: Icon(Icons.visibility,color:Colors.white,)),
                            ) : Padding(padding:EdgeInsets.only(right: 10),child: IconButton(
                              splashRadius: 1,
                              onPressed: (){
                                setState(() {
                                  _visible = true;
                                });
                              },
                              icon: Icon(Icons.visibility_off,color:Colors.white,))),
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.white),
                            errorStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)),
                          ),
                        ).px(4).py(3),
                      ),
                      30.heightBox,
                      ElevatedButton(
                        style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)),
                          backgroundColor: MaterialStateProperty.all(Colors.purple.shade500),
                          shape:MaterialStateProperty.all(StadiumBorder())
                        ),
                        onPressed: () async{
                          if(_formkey.currentState!.validate()){
                            setState(() {
                              _isloading = true;
                            });
                            var res = await AuthenticationService().signupemail(_emailcontroller.text, _passcontroller.text);

                            if(res=="Success"){
                              setState(() {
                                _isloading = false;
                              });
                              verifydialog(context);
                            }
                            
                            setState(() {
                                _isloading = false;
                              });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: res.text.red400.make()));
                          }
                        }, 
                        child: "Sign Up".text.make()
                      ).wh(size.width*.35, size.height*.055),
                    ],
                  ),
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
                  Navigator.push(context, PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 400),
                    transitionsBuilder: (BuildContext context,Animation<double> animation,Animation<double> secAnimation,Widget child){
                      // animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
                      return ScaleTransition(
                        alignment: Alignment.center,
                        scale: animation,
                        child: child,
                      );
                    },
                    pageBuilder: (BuildContext context,Animation<double> animation,Animation<double> secAnimation){
                      return SignIn();
                    }));
                }, 
                child: "Sign in".text.purple700.xl2.make())
            ],
          )
        ),
      ),
    );
  }
}