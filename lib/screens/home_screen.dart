import 'package:flutter/material.dart';
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
        },
        child: "Signout".text.make(),)
    );
  }
}