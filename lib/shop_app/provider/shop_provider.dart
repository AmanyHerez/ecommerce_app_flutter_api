import 'package:flutter/material.dart';

import '../shop_layout/Home_screen.dart';
import '../shop_layout/categories_screen.dart';
import '../shop_layout/favarite_screen.dart';
import '../shop_layout/setting_screen.dart';

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
//************ bottom navigation bar *************//
  int currentIndex=0;
  List<Widget> BnScreen=[
    HomeScreen(),
    CategoriesScreen(),
    FavariteScreen(),
    SettingScreen(),
  ];
  chagebottomNavigationBar(int index){
    currentIndex=index;
    notifyListeners();
  }
}
