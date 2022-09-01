import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireapp/CoustomWidget/CustomButtonp/custombutton.dart';
import 'package:fireapp/CoustomWidget/TextfieldWidget/textfieldwidget.dart';
import 'package:fireapp/NumberOfUser/numberofuser.dart';
import 'package:fireapp/Number_of_ADMIN/numberofadmin.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key,this.eemail,this.ppass,this.userInformation}) : super(key: key);
  final String ? eemail,ppass;
  final UserInformation ? userInformation;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passController=TextEditingController();
  final _formkey= GlobalKey<FormState>();
  bool _emailobscuretext=false;
  bool _passobscuretext=true;
  String ? email,pass;

  String ? eeemail,pppass;

  @override
  Widget build(BuildContext context) {
    CollectionReference admin=FirebaseFirestore.instance.collection("admin");
    Future <void> AddAdmin(){
      return admin.add({
        'email':_emailController.text,
        'pass' : _passController.text
      });
    }
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,size: 33,)),
        title: Text("ADMIN Login Page",style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),),
      ),
      backgroundColor: Colors.black54,
      body: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("FireAlertapp/login.png"),fit: BoxFit.fill)
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
          key: _formkey,
          child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height:80,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(11),
                    border: Border.all(
                      width: 1
                    )
                  ),
                  child: TextfieldWidget(
                    prefixiconButton: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.email_outlined,size: 32,)),
                    obscuretext: _emailobscuretext,
                    controller: _emailController,
                    validator: (value){
                    if(value!.isEmpty){
                    return "Wrong email";
                    }
                    if(!value.contains("uzzal.171.cse@gmail.com")){
                    return "Correct Password";
                    }},
                    hintText: "Email",
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: TextfieldWidget(
                    prefixiconButton: IconButton(onPressed: (){
                      setState((){
                        _passobscuretext=!_passobscuretext;
                      });
                    },
                        icon: Icon( _passobscuretext==false ? Icons.visibility:Icons.visibility_off,size: 32,)),
                    obscuretext: _passobscuretext,
                    controller: _passController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Wrong email";
                      }
                      if(!value.contains("123")){
                        return "Correct Password";
                      }},
                    hintText: "Password",
                  ),
                ),
                SizedBox(height: 20,),
                CustomButtonp(
                  TextButtonname: Text("Login",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),),
                    ontap:(){
                              setState((){
                              var email=_emailController.text.toString();
                              var password=_passController.text.toString();
                              });

                              if(_formkey.currentState!.validate()) {
                                print("Submit Sucess full",);
                                AddAdmin();
                                _emailController.text="";
                                _passController.text="";

                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog(
                                      title: const Text('Aler'),
                                      content: const Text('welcome admin'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => UserInformation(),));

                                          },
                                          child: const Text('ADD NEW'),
                                        ),

                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => UserInformation(),));
                                          },
                                          child: const Text('ALL ADMIN'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => Number_Of_User(),));
                                          },
                                          child: const Text('ALL USERS'),
                                        ),
                                      ],
                                    )
                                );

                              }
                    },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
