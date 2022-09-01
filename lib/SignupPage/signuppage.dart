import 'package:flutter/material.dart';

class SignUp_Page extends StatefulWidget {
  const SignUp_Page({Key? key}) : super(key: key);

  @override
  State<SignUp_Page> createState() => _SignUp_PageState();
}

class _SignUp_PageState extends State<SignUp_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,size: 33,)),
        title: Text("SignUP PAGE",style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),),
      ),
    );
  }
}
