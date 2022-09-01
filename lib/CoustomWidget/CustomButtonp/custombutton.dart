import 'package:flutter/material.dart';

class CustomButtonp extends StatelessWidget {
 CustomButtonp({Key? key,
   required this.TextButtonname,
   required this.ontap,


 }) : super(key: key);
  final Text ? TextButtonname;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(22),
        ),
        child: TextButtonname,
      ),
    );
  }
}
