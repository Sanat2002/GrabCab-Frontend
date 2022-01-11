// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class CabDetail extends StatefulWidget {

  String cabmodel = "";
  String cabbrand = "";
  int cabid;
  int userid;
  int cabodometer;
  int cabprice;
  int cabrent;

  CabDetail({ Key? key,required this.cabmodel,required this.cabbrand,required this.cabprice,required this.cabrent,required this.cabodometer,required this.cabid,required this.userid}) : super(key: key);

  @override
  _CabDetailState createState() => _CabDetailState();
}

class _CabDetailState extends State<CabDetail> {

  makeunavailable() async{
    var url = Uri.parse("https://grabcabbackend.herokuapp.com/Cab/${widget.cabid}/");
    var response = await http.patch(url,body: {'buyrate':"229"});
    var result = jsonDecode(response.body);
    print(result);
  }

  grabasrent() async{
    var url = Uri.parse("https://grabcabbackend.herokuapp.com/Cab/${widget.cabid}/");
    var response = await http.patch(url,body: {'Customer':"${widget.userid}"});
    var result = jsonDecode(response.body);
    print(result);
  }


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
                widget.cabbrand.text.xl3.textStyle(TextStyle(fontFamily: GoogleFonts.davidLibre().fontFamily)).green600.make()
              ],
            ).p(4).py(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                "Model".text.xl3.extraBold.make(),
                widget.cabmodel.text.xl3.textStyle(TextStyle(fontFamily: GoogleFonts.davidLibre().fontFamily)).green600.make()
              ],
            ).p(4).py(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                "Odometer".text.xl3.extraBold.make(),
                "${widget.cabodometer} Km".text.xl3.textStyle(TextStyle(fontFamily: GoogleFonts.davidLibre().fontFamily)).green600.make()
              ],
            ).p(4).py(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                "Price".text.xl3.extraBold.make(),
                "\$${widget.cabprice}".text.xl3.textStyle(TextStyle(fontFamily: GoogleFonts.davidLibre().fontFamily)).green600.make()
              ],
            ).p(4).py(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                "Rent".text.xl3.extraBold.make(),
                "\$${widget.cabrent}/day".text.xl3.textStyle(TextStyle(fontFamily: GoogleFonts.davidLibre().fontFamily)).green600.make()
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
                  onPressed: () async{
                    grabasrent();
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