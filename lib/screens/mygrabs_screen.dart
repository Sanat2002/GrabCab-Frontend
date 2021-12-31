// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        title: "My Grabs".text.xl3.make().px(70),
      ),
      body:Column(
        children: [
          Container(
            color: Colors.black26,
            height: size.height*.44,
            child:SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Rent Cabs".text.xl2.make().p(4),
                  ExpansionTile(
                    iconColor: Colors.purple.shade300,
                    leading: CircleAvatar(),
                    trailing: "Return".text.make(),
                    title: "Audi".text.black.xl.make(),
                    subtitle: "AudiR8".text.color(Vx.gray600).make(),
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              "Audi".text.make(),
                              "AudiR8".text.make()
                            ],
                          ),
                          10.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              "1000km".text.make(),
                              "\$2000".text.make()
                            ],
                          )
                        ],
                      )
            //            Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     "Brand".text.xl.extraBold.make(),
            //     "Audi".text.xl.textStyle(TextStyle(fontFamily: GoogleFonts.davidLibre().fontFamily)).green600.make()
            //   ],
            // ).p(4).py(4),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     "Model".text.xl.extraBold.make(),
            //     "AudiR8".text.xl.textStyle(TextStyle(fontFamily: GoogleFonts.davidLibre().fontFamily)).green600.make()
            //   ],
            // ).p(4).py(4),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     "Odometer".text.xl.extraBold.make(),
            //     "1112".text.xl.textStyle(TextStyle(fontFamily: GoogleFonts.davidLibre().fontFamily)).green600.make()
            //   ],
            // ).p(4).py(4),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     "Price".text.xl.extraBold.make(),
            //     "\$2000".text.xl.textStyle(TextStyle(fontFamily: GoogleFonts.davidLibre().fontFamily)).green600.make()
            //   ],
            // ).p(4).py(4),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     "Rent".text.xl.extraBold.make(),
            //     "\$20/day".text.xl.textStyle(TextStyle(fontFamily: GoogleFonts.davidLibre().fontFamily)).green600.make()
            //   ],
            // ).p(4).py(4),
                    ],
                  ),
                ],
              ),
            )
          ),
          Divider(),
          Container(
            color: Colors.black26,
            height: size.height*.44,
            child:SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Bought Cabs".text.xl2.make().p(4),
                  ExpansionTile(
                    leading: CircleAvatar(),
                    title: "Audi".text.make(),
                    children: [
                      "Audi".text.make()
                    ],
                  ),
                ],
              ),
            )
          ),
        ],
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.purple.shade400,
    //     title: "My Grabs".text.xl3.make().px(70),
    //   ),
    //   body: Container(
    //     height: size.height*.1 ,
    //     decoration: BoxDecoration(
    //       color: Colors.black26,
    //       borderRadius: BorderRadius.all(Radius.circular(20))
    //     ),
    //     child: Row(
    //       children: [
    //         20.widthBox,
    //         CircleAvatar(radius: 33,),
    //         20.widthBox,
    //         SizedBox(width:size.width*.34,child: "Audi".text.xl2.make()),
    //         50.widthBox,
    //         TextButton(
    //           onPressed: (){

    //           }, 
    //           child: "Return".text.rose600.xl2.make())
    //       ],
    //     ),
    //   ).px(10).py(8),
    // );
  }
}