// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabcab/screens/home_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class MyGrabs extends StatefulWidget {
  const MyGrabs({ Key? key }) : super(key: key);

  @override
  _MyGrabsState createState() => _MyGrabsState();
}

class _MyGrabsState extends State<MyGrabs> {

  final _auth = FirebaseAuth.instance;
  var userprof;
  var userid;

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

  returncab(modl) async{
    var cabid;
    var response = await http.get(Uri.parse("https://grabcabbackend.herokuapp.com/Cab/"));
    var res = jsonDecode(response.body);
    print(res);
    for (var cabs in res) {
      if(cabs['modl']==modl){
        cabid = cabs['id'];
        break;
      }
    }
    print(cabid);
    var url = Uri.parse("https://grabcabbackend.herokuapp.com/Cab/$cabid/");
    var resp = await http.patch(url,body: {'Customer':"1",'IsAvailable':"true"});
    print(jsonDecode(resp.body));

  }

  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade400,
        title: "My Grabs".text.xl3.make().px(70),
        leading: IconButton(
          splashRadius: 1,
          onPressed: (){
            Navigator.pushReplacement(context, PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 300),
              transitionsBuilder: (BuildContext context , Animation<double> animation , Animation<double> seanimation, Widget child){
                animation = CurvedAnimation(parent: animation, curve: Curves.easeIn);
                return SizeTransition(
                  sizeFactor: animation,
                  child: child,
                );
              },
              pageBuilder:(BuildContext context, Animation<double> animation, Animation<double> seanimation){
                return Home();
              } ));
          }, icon: Icon(Icons.home)),
      ),
      body:Column(
        children: [
          SizedBox(
            // height: size.height*.44,
            height: size.height*.9,
            child:SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Rented Cabs".text.extraBold.xl2.make().p(4).px(8),
                  Divider(color: Colors.black,).px(6),
                  FutureBuilder(
                    future: getuserdata(),
                    builder: (context,snapshot){
                      if(snapshot.hasData){
                        var data = snapshot.data;
                        var orgdata = data as Map<String,dynamic>;
                        // print(orgdata['RentedCab'][0].runtimeType);
                        var rentcabs = orgdata['RentedCab'] as List;
                        // print(rentcabs);

                        return rentcabs.isEmpty? "You don't have any rented cabs!!!".text.xl2.make().centered().py(300) : ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: rentcabs.length,
                          itemBuilder: (context,index){

                            return ExpansionTile(
                            leading: Image.asset("assets/${rentcabs[index]}.jpg",width: 57,),
                            title: rentcabs[index].toString().text.black.xl.make(),
                            subtitle: "on rent".text.color(Vx.gray600).make(),
                            children: [
                              Column(
                                children: [
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  //   children: [
                                  //     "Audi".text.make(),
                                  //     "AudiR8".text.make()
                                  //   ],
                                  // ),
                                  // 10.heightBox,
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  //   children: [
                                  //     "1000km".text.make(),
                                  //     "\$2000".text.xl.green600.make()
                                  //   ],
                                  // ),
                                  // 10.heightBox,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton(
                                        onPressed: () async{
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Processing...".text.red400.make()));
                                          await returncab(rentcabs[index]);
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "${rentcabs[index]} Successfully returned!!!".text.red400.make()));
                                          setState(() {  
                                          });
                                        }, 
                                        child: "Return".text.red800.xl.make())
                                    ],
                                  ),
                                ],
                              )
                            ],
                          );

                        }); 

                      }
                      return CircularProgressIndicator(color: Colors.purple.shade300,).centered().py(300);
                    })
                  // ExpansionTile(
                  //   leading: Image.asset("assets/nexon.jpg",width: 57,),
                  //   title: "Audi".text.black.xl.make(),
                  //   subtitle: "AudiR8".text.color(Vx.gray600).make(),
                  //   children: [
                  //     Column(
                  //       children: [
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //           children: [
                  //             "Audi".text.make(),
                  //             "AudiR8".text.make()
                  //           ],
                  //         ),
                  //         10.heightBox,
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //           children: [
                  //             "1000km".text.make(),
                  //             "\$2000".text.xl.green600.make()
                  //           ],
                  //         ),
                  //         10.heightBox,
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //           children: [
                  //             TextButton(
                  //               onPressed: (){

                  //               }, 
                  //               child: "Return".text.red800.xl.make())
                  //           ],
                  //         ),
                  //       ],
                  //     )
                  //   ],
                  // ),
                ],
              ),
            )
          ),
          // Divider(color: Vx.gray700,thickness: 2,),
          // SizedBox(
          //   height: size.height*.44,
          //   child:SingleChildScrollView(
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         "Bought Cabs".text.extraBold.xl2.make().p(4).px(8),
          //         Divider(color: Colors.black,).px(6),
          //         ExpansionTile(
          //           leading: CircleAvatar(backgroundColor: Colors.purple.shade200,),
          //           title: "Audi".text.black.xl.make(),
          //           subtitle: "AudiR8".text.color(Vx.gray600).make(),
          //           children: [
          //             Column(
          //               children: [
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                   children: [
          //                     "Audi".text.make(),
          //                     "AudiR8".text.make()
          //                   ],
          //                 ),
          //                 10.heightBox,
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                   children: [
          //                     "1000km".text.make(),
          //                     "\$2000".text.xl.green600.make()
          //                   ],
          //                 )
          //               ],
          //             )
          //           ],
          //         ),
          //       ],
          //     ),
          //   )
          // ),
        ],
      ),
    );
  }
}