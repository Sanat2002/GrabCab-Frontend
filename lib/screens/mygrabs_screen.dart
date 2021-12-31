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
          SizedBox(
            height: size.height*.44,
            child:SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Rent Cabs".text.extraBold.xl2.make().p(4).px(8),
                  Divider(color: Colors.black,).px(6),
                  ExpansionTile(
                    leading: CircleAvatar(backgroundColor: Colors.purple.shade200,),
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
                              "\$2000".text.xl.green600.make()
                            ],
                          ),
                          10.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                onPressed: (){

                                }, 
                                child: "Return".text.red800.xl.make())
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ),
          Divider(color: Vx.gray700,thickness: 2,),
          SizedBox(
            height: size.height*.44,
            child:SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Bought Cabs".text.extraBold.xl2.make().p(4).px(8),
                  Divider(color: Colors.black,).px(6),
                  ExpansionTile(
                    leading: CircleAvatar(backgroundColor: Colors.purple.shade200,),
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
                              "\$2000".text.xl.green600.make()
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}