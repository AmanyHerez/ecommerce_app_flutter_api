import 'package:flutter/material.dart';
class DefaultTextField extends StatelessWidget {
  TextEditingController controller;
  TextInputType? textInputType;
  Widget? suffix;
  final String? title;
  final Function validator;
  final Function?  onChanged;
  bool? obscureText;

  DefaultTextField(
      { this.title,
        required this.validator,
        required this.controller,
        this.suffix,
        this. onChanged,
        this.obscureText,
        this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:(x) =>  onChanged!(x) ,
      obscureText: obscureText?? false,
      keyboardType: textInputType,
      controller: controller,
      validator: (x) => validator(x),

      decoration: InputDecoration(


        suffix: suffix,
        label: Text(title!),
        labelStyle: TextStyle(
fontWeight: FontWeight.bold,

        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
