import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
 TextfieldWidget({Key? key,

   required this.hintText,
   required this.controller,
   required this.obscuretext,
   required this.prefixiconButton,
     this.validator


 }) : super(key: key);
   final String? Function(dynamic value)? validator;
  final String ? hintText;
  final TextEditingController? controller;
  final bool obscuretext;
  final IconButton ? prefixiconButton;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      style: TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.w500,
        fontSize: 22,
      ),
      obscureText: obscuretext,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixiconButton,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 20,
          color: Colors.white70,
        ),
        border: InputBorder.none
      ),
    );
  }
}
