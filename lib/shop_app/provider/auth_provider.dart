import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

import '../data/dio_helper.dart';
import '../data/sp_helper.dart';
import '../router/router.dart';
import '../view/auth_screen/login_screen.dart';

class AuthProvider extends ChangeNotifier {
  //************ visible or not password*************//
  bool isObscure = false;
  IconData suffix = Icons.visibility;

  changeVisiblityPassword() {
    isObscure = !isObscure;
    suffix = isObscure ? Icons.visibility_off : Icons.visibility;
    notifyListeners();
  }

  //***************login************************//
  GlobalKey<FormState> loginKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() async {
    String token = await DioHelper.dioHelper.login(
      emailController.text,
      passwordController.text,
    );
    //SpHelper.spHelper.SaveToken(token);

    log(" token :${token}");
  }

  /////////////////////***********Register*************/////////////////////
  GlobalKey<FormState> RegisterKey = GlobalKey();
  TextEditingController emailRegController = TextEditingController();
  TextEditingController passwordRegController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Register() async {
    await DioHelper.dioHelper.Register(
        nameController.text,
        emailRegController.text,
        passwordRegController.text,
        phoneController.text);
  }

  //***************method Signout***********************//
  SignOut() {
    SpHelper.spHelper.deleteToken();
    AppRouter.NavigateWithReplacemtnToWidget(LoginScreen());
  }

  ///////////////************method validation****************////////////////
  nullValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
  }

  emailValidation(String value) {
    if (!isEmail(value)) {
      return "صيغة الايميل خاطئة";
    }
  }

  passwordValidation(String value) {
    if (value.length < 6) {
      return ' يجب ان تكون كلمة السر 6 حروف على الاقل';
    }
  }
}
