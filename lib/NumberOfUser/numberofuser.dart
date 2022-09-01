import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

  class Number_Of_User extends StatefulWidget {
  const Number_Of_User({Key? key}) : super(key: key);
  @override
  State<Number_Of_User> createState() => _Number_Of_UserState();
}

class _Number_Of_UserState extends State<Number_Of_User> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('user').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);}, icon: Icon(Icons.arrow_back,size: 33,)),
          centerTitle: true,
          title: Text("NUMBER OF USER"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
            return Text("Somthing is wrong");
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return Text(" Loading ");
          }
          return ListView(
            children: snapshot.data!.docs.map((document) {
             Map<String, dynamic> data =document.data()! as Map<String, dynamic>;
              return Card(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                elevation: 6,
                child: ListTile(
                  leading: Text("${data['email']}"),
                  subtitle: Text("${data['pass']}"),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
