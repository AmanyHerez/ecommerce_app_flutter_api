import 'package:flutter/material.dart';

class ShopProvider extends ChangeNotifier {
  //************ visible or not password*************//
  bool isObscure = true;
  IconData suffix = Icons.visibility;

  changeVisiblityPassword() {
    isObscure = !isObscure;
    suffix = isObscure ? Icons.visibility_off : Icons.visibility;
    notifyListeners();
  }
//**************************************************//
TextEditingController emailController=TextEditingController();
TextEditingController passwordController=TextEditingController();
}
