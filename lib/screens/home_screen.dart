// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right:0,
                child: TextFormField(
                  cursorColor: Colors.purple.shade300,
                  cursorHeight: 25,
                  style: TextStyle(
                    color: Colors.purple.shade400,
                  ),
                  onChanged: (value){
        
                  },
                  decoration: InputDecoration(
                    hintText: "Search for cabs",
                    hintStyle: TextStyle(
                      color: Colors.black45,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)
                    )
                  ),
                ).px(30)
              ),
              Positioned(
                top: 70,
                left: 0,
                right: 0,
                bottom: 0,
                child: ListView(
                  children: [
                    Container(
                      height: size.height*.35,
                      decoration: BoxDecoration(
                        color: Colors.purple.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: size.height*.28,
                            decoration:BoxDecoration(
                              color: Colors.black,
                              borderRadius:BorderRadius.all(Radius.circular(10))
                            )
                          ).px(10).py(4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              "Audi".text.xl3.make(),
                              "Rs 2000".text.xl3.make(),
                            ],
                          ).py(7)
                        ],
                      ),
                    ).px(17)
                  ],
                ))
            ],
          ),
        ),
      ),
      drawer: Drawer(),
    );
  }
}