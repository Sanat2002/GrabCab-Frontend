// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyGrabs extends StatefulWidget {
  const MyGrabs({ Key? key }) : super(key: key);

  @override
  _MyGrabsState createState() => _MyGrabsState();
}

class _MyGrabsState extends State<MyGrabs> {

  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade400,
        title: "MY Grabs".text.xl3.make().px(70),
      ),
      body: Container(
        height: size.height*.1 ,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            20.widthBox,
            CircleAvatar(radius: 33,),
            20.widthBox,
            SizedBox(width:size.width*.34,child: "Audi".text.xl2.make()),
            50.widthBox,
            TextButton(
              onPressed: (){

              }, 
              child: "Return".text.rose600.xl2.make())
          ],
        ),
      ).px(10).py(8),
    );
  }
}