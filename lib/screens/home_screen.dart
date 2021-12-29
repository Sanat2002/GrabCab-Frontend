import 'package:flutter/material.dart';
import 'package:grabcab/screens/signin_screen.dart';
import 'package:grabcab/services/authentication.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ElevatedButton(
        onPressed: () async{
          await AuthenticationService().signout();
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const SignIn()), (route) => false);
        },
        child: "Signout".text.make().centered(),)
    );
  }
}