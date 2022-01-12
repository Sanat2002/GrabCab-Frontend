// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  var searchcabname = ValueNotifier<String>("");
  final _auth = FirebaseAuth.instance;

  String _name="";
  String _email="";
  String _pass="";
  String _name2="";
  String _email2="";
  String _pass2="";
  late int userid;
  late var userprof;
  var unrentcabs2 = [];
  var serentcabs = [];

  @override
  void initState() {
    getuserdata();
    super.initState();
  }

  getsearchcabs(scabsname){
    serentcabs = [];
    for(var cabs in unrentcabs2){
      if(cabs['modl'].contains(scabsname)){
        serentcabs.add(cabs);
      }
    }
  }

  getuserdata() async{
    var response = await http.get(Uri.parse("https://grabcabbackend.herokuapp.com/User/"));
    var res = jsonDecode(response.body);
    for (var user in res) {
      if(user['mail']==_auth.currentUser!.email){
        userid = user['id'];
        userprof = user;
        break;
      }
    }
    return userprof;
  }

  getcablist() async{
    var response = await http.get(Uri.parse("https://grabcabbackend.herokuapp.com/Cab/"));
    if(response.statusCode==200){
      var result = jsonDecode(response.body);
      return result;
    }
  }

  updateprofileapi() async{
    print(_email2);
    print(_pass2);
    await AuthenticationService().updateemail(_email2);
    await AuthenticationService().updatepass(_pass2);
    var url = Uri.parse("https://grabcabbackend.herokuapp.com/User/$userid/");
    var response = await http.patch(url,body: {'username':_name2,'mail':_email2,'password':_pass2});
    print(jsonDecode(response.body));
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
                    initialValue: _name,
                    onChanged: (e){
                      _name2 = e;
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
                    initialValue: _email,
                    onChanged: (e){
                      _email2 = e;
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
                    initialValue: _pass,
                    onChanged: (e){
                      _pass2 = e;
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
                    onPressed: () async{
                      if(_formkey.currentState!.validate()){
                        updateprofileapi();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Profile Updated!!!".text.red400.make()));
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
                    getsearchcabs(value);
                    searchcabname.value = value;
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
                child: FutureBuilder(
                  future: getcablist(),
                  builder: (context, snapshot){
                    if(snapshot.hasData){

                      var data = snapshot.data;
      
                      var ordata = [];
                      var unrentcabs = [];
                      ordata = data as List<dynamic>; // this is done because data is giving null error
                        
                      for(var cab in ordata){
                        if(cab['IsAvailable']==true){
                          unrentcabs.add(cab);
                        }
                      }
                      unrentcabs2 = unrentcabs;

                      return ValueListenableBuilder(
                        valueListenable: searchcabname,
                        builder: (BuildContext context,String value,Widget?child){
                          return ListView.builder(
                          shrinkWrap: true,
                          itemCount: value.isNotEmpty?serentcabs.length : unrentcabs.length,
                          itemBuilder: (context,index){
                            return InkWell(
                              onTap: (){
                                value.isNotEmpty? Navigator.push(context, MaterialPageRoute(builder:  (context)=>CabDetail(cabmodel: serentcabs[index]['modl'],cabbrand: serentcabs[index]['brand'],cabprice: serentcabs[index]['buyrate'],cabrent: serentcabs[index]['rentrate'],cabodometer: serentcabs[index]['odometer'],cabid: serentcabs[index]['id'],userid: userid,))) : Navigator.push(context, MaterialPageRoute(builder:  (context)=>CabDetail(cabmodel: unrentcabs[index]['modl'],cabbrand: unrentcabs[index]['brand'],cabprice: unrentcabs[index]['buyrate'],cabrent: unrentcabs[index]['rentrate'],cabodometer: unrentcabs[index]['odometer'],cabid: unrentcabs[index]['id'],userid: userid,)));
                              },
                              child: Container(
                                height: size.height*.35,
                                decoration: BoxDecoration(
                                  color: Vx.gray300,
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: size.height*.28,
                                      width: size.width*.9,
                                      decoration:BoxDecoration(
                                        borderRadius:BorderRadius.all(Radius.circular(10))
                                      ),
                                      child: Hero(tag:value.isNotEmpty? serentcabs[index]['modl'] : unrentcabs[index]['modl'],child: value.isNotEmpty? Image.asset("assets/${serentcabs[index]['modl']}.jpg") :Image.asset("assets/${unrentcabs[index]['modl']}.jpg")),
                                    ).px(10),
                                    Divider(color: Colors.black,).px(18),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        value.isNotEmpty? serentcabs[index]['modl'].toString().text.textStyle(TextStyle(fontFamily: GoogleFonts.glassAntiqua().fontFamily)).xl4.make() : unrentcabs[index]['modl'].toString().text.textStyle(TextStyle(fontFamily: GoogleFonts.glassAntiqua().fontFamily)).xl4.make(),
                                        value.isNotEmpty? "\$${serentcabs[index]['rentrate']}".text.white.xl3.make() : "\$${unrentcabs[index]['rentrate']}".text.white.xl3.make(),
                                      ],
                                    )
                                  ],
                                ),
                              ).px(17),
                            ).py(5);
                        });
                      });
                      // return ListView.builder(
                      //   shrinkWrap: true,
                      //   itemCount: unrentcabs.length,
                      //   itemBuilder: (context,index){
                      //     return InkWell(
                      //       onTap: (){
                      //         Navigator.push(context, MaterialPageRoute(builder:  (context)=>CabDetail(cabmodel: unrentcabs[index]['modl'],cabbrand: unrentcabs[index]['brand'],cabprice: unrentcabs[index]['buyrate'],cabrent: unrentcabs[index]['rentrate'],cabodometer: unrentcabs[index]['odometer'],cabid: unrentcabs[index]['id'],userid: userid,)));
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
                      //               child: Hero(tag:unrentcabs[index]['modl'],child: Image.asset("assets/${unrentcabs[index]['modl']}.jpg")),
                      //             ).px(10),
                      //             Divider(color: Colors.black,).px(18),
                      //             Row(
                      //               mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //               children: [
                      //                 unrentcabs[index]['modl'].toString().text.textStyle(TextStyle(fontFamily: GoogleFonts.glassAntiqua().fontFamily)).xl4.make(),
                      //                 "\$${unrentcabs[index]['rentrate']}".text.white.xl3.make(),
                      //               ],
                      //             )
                      //           ],
                      //         ),
                      //       ).px(17),
                      //     ).py(5);
                      // });
                    }

                  return CircularProgressIndicator().centered();
                })
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: FutureBuilder(
          future: getuserdata(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              var data = snapshot.data;
              var user = data as Map<String,dynamic>;
              _name = user['username'];
              _email = user['mail'];
              _pass = user['password'];

              _name2 = _name;
              _email2 = _email;
              _pass2 = _pass;

              return ListView(
                  children :[ 
                    DrawerHeader(
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: Vx.gray300,
                        borderRadius: BorderRadius.all(Radius.elliptical(20, 40))
                        ),
                      currentAccountPicture: CircleAvatar(backgroundColor: Colors.purple.shade200,),
                      accountName: user['username'].toString().text.black.xl3.make(),
                      accountEmail: user['mail'].toString().text.black.make(),
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
                        Navigator.pushAndRemoveUntil(context,  PageRouteBuilder(
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
                        }), (route) => false);
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
                  ]);
            }

            return CircularProgressIndicator().centered();
          }),
        // child: ListView(
        //   children :[ 
        //     DrawerHeader(
        //     child: UserAccountsDrawerHeader(
        //       decoration: BoxDecoration(
        //         color: Vx.gray300,
        //         borderRadius: BorderRadius.all(Radius.elliptical(20, 40))
        //         ),
        //       currentAccountPicture: CircleAvatar(backgroundColor: Colors.purple.shade200,),
        //       // accountName: userprof['username'].toString().text.black.xl3.make(),
        //       accountName: "ls".text.black.xl3.make(),
        //       accountEmail: "sanathakur2002@gamil.com".text.black.make(),
        //     )).h(220),
        //     ListTile(
        //       leading: Icon(Icons.person,color:Colors.black),
        //       tileColor: Vx.gray300,
        //       title: Padding(padding: EdgeInsets.only(left: 25),child: "Profile".text.xl.make()),
        //       onTap: (){
        //         profiledialog(context);
        //       },
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.all(Radius.elliptical(10, 20))
        //       ),
        //       contentPadding: EdgeInsets.only(left:20),
        //     ).px(15),
        //     10.heightBox,
        //     ListTile(
        //       leading: Icon(Icons.car_rental,color:Colors.black),
        //       tileColor: Vx.gray300,
        //       title: Padding(padding: EdgeInsets.only(left: 25),child: "My Grabs".text.xl.make()),
        //       onTap: (){
        //         Navigator.push(context, PageRouteBuilder(
        //           transitionDuration: Duration(milliseconds: 500),
        //           transitionsBuilder: (BuildContext context,Animation<double> animation,Animation<double> secanimation,Widget child){
        //             animation = CurvedAnimation(parent: animation, curve: Curves.easeOutQuad);
        //             return Align(
        //               child: SizeTransition(
        //                 sizeFactor: animation,
        //                 child:child),
        //             );
        //           },
        //           pageBuilder: (BuildContext context,Animation<double> animation,Animation<double> secanimation){
        //           return MyGrabs();
        //         }));
        //       },
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.all(Radius.elliptical(10, 20))
        //       ),
        //       contentPadding: EdgeInsets.only(left:20),
        //     ).px(15),
        //     10.heightBox,
        //     ListTile(
        //       leading: Icon(Icons.door_back_door_outlined,color:Colors.black),
        //       tileColor: Vx.gray300,
        //       title: Padding(padding: EdgeInsets.only(left: 25),child: "Sign out".text.xl.make()),
        //       onTap: () async{
        //         await AuthenticationService().signout();
        //         Navigator.pushAndRemoveUntil(context, 
        //         PageRouteBuilder(
        //           transitionDuration: Duration(milliseconds: 300),
        //           transitionsBuilder: (BuildContext context,Animation<double> animation,Animation<double> secanimation,Widget child){
        //             return SlideTransition(
        //               position: Tween<Offset>(
        //                 begin: Offset(-1, 0),
        //                 end: Offset(0, 0)).animate(animation),
        //               child:child,
        //             );
        //           },
        //           pageBuilder: (BuildContext context ,Animation<double> animation,Animation<double> secanimation){
        //             return SignIn();
        //           }), 
        //           (route) => false);
        //       },
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.all(Radius.elliptical(10, 20))
        //       ),
        //       contentPadding: EdgeInsets.only(left:20),
        //     ).px(15),
        //   ]),
      ),
    );
  }
}