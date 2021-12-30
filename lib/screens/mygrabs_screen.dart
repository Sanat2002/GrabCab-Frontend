// ignore_for_file: prefer_const_constructors

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade400,
        title: "MY Grabs".text.xl3.make().px(70),
      ),
    );
  }
}