import 'dart:developer';

import 'package:final_gsg_app_flutter/shop_app/data/dio_helper.dart';
import 'package:final_gsg_app_flutter/shop_app/data/sp_helper.dart';
import 'package:final_gsg_app_flutter/shop_app/models/categories_model.dart';
import 'package:final_gsg_app_flutter/shop_app/models/home_model.dart';
import 'package:final_gsg_app_flutter/shop_app/router/router.dart';
import 'package:final_gsg_app_flutter/shop_app/view/auth_screen/login_screen.dart';
import 'package:flutter/material.dart';

import '../shop_layout/Home_screen.dart';
import '../shop_layout/categories_screen.dart';
import '../shop_layout/favarite_screen.dart';
import '../shop_layout/setting_screen.dart';

class ShopProvider extends ChangeNotifier {
  ShopProvider(){
    getHomeData();
    getCategoriesData();
  }

//************ bottom navigation bar *************//
  int currentIndex = 0;
  List<Widget> BnScreen = [
    HomeScreen(),
    CategoriesScreen(),
    FavariteScreen(),
    SettingScreen(),
  ];

  chagebottomNavigationBar(int index) {
    currentIndex = index;
    notifyListeners();
  }
  List<BannersModel> Banners=[];
  List<ProductsModel> Products=[];
  List<DataModel> Categories=[];

  getHomeData()async{
    HomeModel  homeModel= await DioHelper.dioHelper.getHomeData();
    Products.addAll(homeModel.data!.products!.toList());
    Banners.addAll(homeModel.data!.banners!.toList());
    notifyListeners();
  }
  getCategoriesData()async{
    CategoriesModel  categoriesModel= await DioHelper.dioHelper.getCategoriesData();
    Categories.addAll(categoriesModel.data!.data!.toList());
    notifyListeners();
  }
}
