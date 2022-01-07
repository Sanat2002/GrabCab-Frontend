// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabcab/screens/cabdetail_screen.dart';
import 'package:grabcab/screens/mygrabs_screen.dart';
import 'package:grabcab/screens/signin_screen.dart';
import 'package:grabcab/services/authentication.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _formkey = GlobalKey<FormState>();

  String _name="";
  String _email="";
  String _pass="";

  getcablist() async{
    var response = await http.get(Uri.parse("http://grabcabgo.herokuapp.com/Cab/"));
    var result = jsonDecode(response.body);
    // print(result);
    return result;
  }

  profiledialog(BuildContext context){
    Size size = MediaQuery.of(context).size;

    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          content: SizedBox(
            height: size.height*.467,
            width: size.width,
            child: Form(
              key:_formkey,
              child: Column(
                children: [
                  "Profile".text.xl4.textStyle(TextStyle(fontFamily: GoogleFonts.cardo().fontFamily)).make(),
                  Divider(color: Colors.black,),
                  TextFormField(
                    onChanged: (e){
                      _name = e;
                    },
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter name";
                      }
                      return null;
                    },
                    cursorColor: Colors.purple.shade300,
                    cursorHeight: 23,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: GoogleFonts.cardo().fontFamily,
                      fontSize: 18
                    ),
                    decoration: InputDecoration(
                      hintText: "Enter name",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple.shade300)
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple.shade300)
                      ),
                    ),
                  ),
                  20.heightBox,
                  TextFormField(
                    onChanged: (e){
                      _email = e;
                    },
                    validator: (value){
                      if(!EmailValidator.validate(value!)){
                        return "Enter valid email";
                      }
                      return null;
                    },
                    cursorColor: Colors.purple.shade300,
                    cursorHeight: 23,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: GoogleFonts.cardo().fontFamily,
                      fontSize: 18
                    ),
                    decoration: InputDecoration(
                      hintText: "Enter email address",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple.shade300)
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple.shade300)
                      ),
                    ),
                  ),
                  20.heightBox,
                  TextFormField(
                    onChanged: (e){
                      _pass = e;
                    },
                    validator: (value){
                      if(value!.length<6){
                        return "Length should be greater than 6";
                      }
                      return null;
                    },
                    cursorColor: Colors.purple.shade300,
                    cursorHeight: 23,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: GoogleFonts.cardo().fontFamily,
                      fontSize: 18
                    ),
                    decoration: InputDecoration(
                      hintText: "Enter password",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple.shade300)
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple.shade300)
                      ),
                    ),
                  ),
                  40.heightBox,
                  ElevatedButton(
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(TextStyle(fontSize:18)),
                      backgroundColor: MaterialStateProperty.all(Colors.purple.shade300),
                    ),
                    onPressed: (){
                      if(_formkey.currentState!.validate()){

                      }
                    }, 
                    child: "Update".text.textStyle(TextStyle(fontFamily:GoogleFonts.cardo().fontFamily)).make())
                ],
              ),
            ),
          ),
        );
      });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // getcablist();

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
                // child: "hleo".text.make()
                child: FutureBuilder(
                  future: getcablist(),
                  builder: (BuildContext context, snapshot){
                    if(snapshot.hasData){
                      var data = snapshot.data;
                      print(data);
                      return CircleAvatar();
                    }
                  return CircularProgressIndicator().centered();
                })
                // child: ListView(
                //   children: [
                //     InkWell(
                //       onTap: (){
                //         Navigator.push(context, MaterialPageRoute(builder:  (context)=>CabDetail()));
                //       },
                //       child: Container(
                //         height: size.height*.35,
                //         decoration: BoxDecoration(
                //           color: Vx.gray300,
                //           borderRadius: BorderRadius.all(Radius.circular(10))
                //         ),
                //         child: Column(
                //           children: [
                //             Container(
                //               height: size.height*.28,
                //               width: size.width*.9,
                //               decoration:BoxDecoration(
                //                 borderRadius:BorderRadius.all(Radius.circular(10))
                //               ),
                //               child: Hero(tag:"el",child: Image.asset("assets/del.JPG")),
                //             ).px(10),
                //             Divider(color: Colors.black,).px(18),
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceAround,
                //               children: [
                //                 "Audi".text.textStyle(TextStyle(fontFamily: GoogleFonts.glassAntiqua().fontFamily)).xl4.make(),
                //                 "\$2000".text.white.xl3.make(),
                //               ],
                //             )
                //           ],
                //         ),
                //       ).px(17),
                //     )
                //   ],
                // )
              )
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
                profiledialog(context);
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
                Navigator.push(context, PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500),
                  transitionsBuilder: (BuildContext context,Animation<double> animation,Animation<double> secanimation,Widget child){
                    animation = CurvedAnimation(parent: animation, curve: Curves.easeOutQuad);
                    return Align(
                      child: SizeTransition(
                        sizeFactor: animation,
                        child:child),
                    );
                  },
                  pageBuilder: (BuildContext context,Animation<double> animation,Animation<double> secanimation){
                  return MyGrabs();
                }));
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
            ).px(15),
          ]),
      ),
    );
  }
}