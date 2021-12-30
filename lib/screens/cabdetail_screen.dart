import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CabDetail extends StatefulWidget {
  const CabDetail({ Key? key }) : super(key: key);

  @override
  _CabDetailState createState() => _CabDetailState();
}

class _CabDetailState extends State<CabDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(tag: "el", child: Lottie.asset("assets/images/del.JPG")),
    );
  }
}