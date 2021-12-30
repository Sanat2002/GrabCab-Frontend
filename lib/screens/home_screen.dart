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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade400,
        title:"GrabCab".text.xl4.make().px(size.width*.15)
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right:0,
            child: TextFormField(
              onChanged: (value){

              },

            ).px(30)
          )
        ],
      ),
      drawer: Drawer(),
    );
  }
}