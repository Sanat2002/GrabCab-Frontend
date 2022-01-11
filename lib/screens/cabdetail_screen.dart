// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class CabDetail extends StatefulWidget {

  String cabmodel = "";
  String cabbrand = "";
  // String cabodometer = "";
  String cabprice = "";
  String cabrent = "";

  CabDetail({ Key? key,required this.cabmodel,required this.cabbrand,required this.cabprice,required this.cabrent}) : super(key: key);

  @override
  _CabDetailState createState() => _CabDetailState();
}

class _CabDetailState extends State<CabDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(tag:widget.cabmodel,transitionOnUserGestures: true,child: Padding(
              padding: EdgeInsets.only(top: 36),
              child: Container(
                decoration: BoxDecoration(
                  color: Vx.gray200,
                  borderRadius: BorderRadius.all(Radius.elliptical(20, 40))
                ),
                height:size.height*.4 ,
                width: size.width*.9,
                child: Image.asset("assets/${widget.cabmodel}.jpg")).px(20),
            )),
            Divider(color: Colors.black).px(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                "Brand".text.xl3.extraBold.make(),
                "Audi".text.xl3.textStyle(TextStyle(fontFamily: GoogleFonts.davidLibre().fontFamily)).green600.make()
              ],
            ).p(4).py(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                "Model".text.xl3.extraBold.make(),
                "AudiR8".text.xl3.textStyle(TextStyle(fontFamily: GoogleFonts.davidLibre().fontFamily)).green600.make()
              ],
            ).p(4).py(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                "Odometer".text.xl3.extraBold.make(),
                "1112".text.xl3.textStyle(TextStyle(fontFamily: GoogleFonts.davidLibre().fontFamily)).green600.make()
              ],
            ).p(4).py(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                "Price".text.xl3.extraBold.make(),
                "\$2000".text.xl3.textStyle(TextStyle(fontFamily: GoogleFonts.davidLibre().fontFamily)).green600.make()
              ],
            ).p(4).py(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                "Rent".text.xl3.extraBold.make(),
                "\$20/day".text.xl3.textStyle(TextStyle(fontFamily: GoogleFonts.davidLibre().fontFamily)).green600.make()
              ],
            ).p(4).py(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                "Quantity".text.xl3.extraBold.make(),
                "3".text.xl3.textStyle(TextStyle(fontFamily: GoogleFonts.davidLibre().fontFamily)).green600.make().px(17)
              ],
            ).p(4).py(4),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: size.height*.1,
        child: Column(
          children: [
            "Grab as :".text.textStyle(TextStyle(fontFamily: GoogleFonts.davidLibre().fontFamily)).xl4.make(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style:ButtonStyle(
                    backgroundColor:MaterialStateProperty.all(Colors.purple.shade300),
                  ),
                  onPressed: (){
      
                  },
                  child: "Rent".text.textStyle(TextStyle(fontFamily: GoogleFonts.davidLibre().fontFamily)).xl3.make()),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all(Colors.purple.shade600)
                  ),
                  onPressed: (){
      
                  },
                  child: "Buy".text.textStyle(TextStyle(fontFamily: GoogleFonts.davidLibre().fontFamily)).xl3.make())
              ],
            ).py(0),
          ],
        ),
      ),
    );
  }
}