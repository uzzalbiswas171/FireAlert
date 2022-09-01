import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('admin').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        centerTitle: true,
        title: Text("NUMBER OF ADMIN"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(color: Colors.red,);
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  elevation: 10,
                  child: ListTile(
                    title: Text(data['email']),
                    subtitle: Text(data['pass']),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}