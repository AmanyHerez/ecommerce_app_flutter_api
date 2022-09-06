import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  TextEditingController controller;
  TextInputType? textInputType;
  Widget? suffix;
  final String? title;
  final Function validator;
  final Function?  onChanged;
  bool? obscureText;

  CustomTextfield(
      { this.title,
        required this.validator,
        required this.controller,
        this.suffix,
        this. onChanged,
        this.obscureText,
        this.textInputType});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      onChanged:(x) =>  onChanged!(x) ,
      obscureText: obscureText?? false,
      keyboardType: textInputType,
      controller: controller,
      validator: (x) => validator(x),

      decoration: InputDecoration(


        suffix: suffix,
        hintText: title,
        hintStyle: TextStyle(


        ),
        // border: OutlineInputBorder(
        //   borderSide: BorderSide.none,
        //   borderRadius: BorderRadius.circular(15),
        // ),
      ),
    );
  }
}