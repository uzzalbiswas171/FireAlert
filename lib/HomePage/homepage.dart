import 'package:fireapp/CoustomWidget/CustomButtonp/custombutton.dart';
import 'package:fireapp/LoginPage/loginpage.dart';
import 'package:fireapp/NumberOfUser/numberofuser.dart';
import 'package:fireapp/Number_of_ADMIN/numberofadmin.dart';
import 'package:fireapp/UserLoginPage/userloginpage.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // @override
  // void initState() {
  //   Future.delayed(Duration(seconds: 6),(){
  //    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
  //   });
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       alignment: Alignment.center,
       height: double.infinity,
       width: double.infinity,
       decoration: BoxDecoration(
         image: DecorationImage(image: AssetImage("FireAlertapp/firehome.png"),fit: BoxFit.fill),
       ),
       child:Container(
         height: 100,
         width: double.infinity,
       //  color: Colors.blue,
         child: Row(
           children: [
             Expanded(
                 flex:1,
                 child: CustomButtonp(
                   ontap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                   },
                   TextButtonname: Text("ADMID LOGIN"),
                 )),
             SizedBox(width: 10,),
             Expanded(
                 flex:1,
                 child: CustomButtonp(
                   ontap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => UserLoginPage(),));
                   },
                   TextButtonname: Text("USER LOGIN"),
                 )),
           ],
         ),
       ) ,
     ),
    );
  }
}
