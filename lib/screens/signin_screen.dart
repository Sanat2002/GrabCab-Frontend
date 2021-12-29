// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grabcab/painters/signin_painter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:email_validator/email_validator.dart';

class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool _visible = false;

  final _formkey = GlobalKey<FormState>();

  final _emailcontroller = TextEditingController();
  final _passcontroller = TextEditingController();

  verifydialog(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
    });
  }

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
                        height: size.height*.08,
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
                        ).px(5),
                      ),
                      25.heightBox,
                      Container(
                        height: size.height*.08,
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
                        ).px(5),
                      ),
                      50.heightBox,
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.purple.shade400),
                          shape: MaterialStateProperty.all(StadiumBorder())
                        ),
                        onPressed: (){
                          if(_formkey.currentState!.validate()){
                            verifydialog(context);
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