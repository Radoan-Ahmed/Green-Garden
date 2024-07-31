import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  String hintText;
  bool readOnly;
  Widget? suffixIcon;
  Widget? prefixIcon;
  Color fillColor;
  bool obscureText;
  FocusNode? focusNode;
  final Function(String)? onChanged; 
  CustomTextField({
    required this.hintText,
    this.readOnly = false,
    this.suffixIcon,
    this.prefixIcon,
    this.fillColor = Colors.white,
    //  ColorRes.textFieldColor,
    this.onChanged,
    this.obscureText = false,
    this.focusNode,
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        focusNode: focusNode,
        obscureText: obscureText,
        readOnly: readOnly,
        onChanged: (value){
          if(onChanged!=null){
            onChanged!(value);
          }
        },
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: fillColor,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          // Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: BorderSide.none,
          ),
          
        ),
      ),
    );
  }
}
