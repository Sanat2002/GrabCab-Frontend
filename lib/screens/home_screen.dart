// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                    fontSize: 18,
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
                              "Audi".text.textStyle(TextStyle(fontFamily: GoogleFonts.glassAntiqua().fontFamily)).xl4.make(),
                              "\$2000".text.white.xl3.make(),
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
      drawer: Drawer(
        child: ListView(
          children :[ 
            DrawerHeader(
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Vx.gray300,
                borderRadius: BorderRadius.all(Radius.elliptical(20, 40))
                ),
              currentAccountPicture: CircleAvatar(backgroundColor: Colors.purple.shade200,),
              accountName: "Sanat".text.black.xl3.make(),
              accountEmail: "sanathakur2002@gamil.com".text.black.make(),
            )).h(220),
            ListTile(
              leading: Icon(Icons.person,color:Colors.black),
              tileColor: Vx.gray300,
              title: Padding(padding: EdgeInsets.only(left: 25),child: "Profile".text.xl.make()),
              onTap: (){
                
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.elliptical(10, 20))
              ),
              contentPadding: EdgeInsets.only(left:20),
            ).px(15),
            10.heightBox,
            ListTile(
              leading: Icon(Icons.car_rental,color:Colors.black),
              tileColor: Vx.gray300,
              title: Padding(padding: EdgeInsets.only(left: 25),child: "My Grabs".text.xl.make()),
              onTap: (){
                
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.elliptical(10, 20))
              ),
              contentPadding: EdgeInsets.only(left:20),
            ).px(15),
            10.heightBox,
            ListTile(
              leading: Icon(Icons.door_back_door_outlined,color:Colors.black),
              tileColor: Vx.gray300,
              title: Padding(padding: EdgeInsets.only(left: 25),child: "Sign out".text.xl.make()),
              onTap: () async{
                await AuthenticationService().signout();
                Navigator.pushAndRemoveUntil(context, 
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 300),
                  transitionsBuilder: (BuildContext context,Animation<double> animation,Animation<double> secanimation,Widget child){
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(-1, 0),
                        end: Offset(0, 0)).animate(animation),
                      child:child,
                    );
                  },
                  pageBuilder: (BuildContext context ,Animation<double> animation,Animation<double> secanimation){
                    return SignIn();
                  }), 
                  (route) => false);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.elliptical(10, 20))
              ),
              contentPadding: EdgeInsets.only(left:20),
            ).px(15)
          ]),
      ),
    );
  }
}