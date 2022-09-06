import 'dart:developer';

import 'package:final_gsg_app_flutter/shop_app/data/dio_helper.dart';
import 'package:final_gsg_app_flutter/shop_app/data/sp_helper.dart';
import 'package:final_gsg_app_flutter/shop_app/models/categories_model.dart';
import 'package:final_gsg_app_flutter/shop_app/models/home_model.dart';
import 'package:final_gsg_app_flutter/shop_app/models/login_model.dart';
import 'package:final_gsg_app_flutter/shop_app/router/router.dart';
import 'package:final_gsg_app_flutter/shop_app/view/auth_screen/login_screen.dart';
import 'package:flutter/material.dart';

import '../models/change_favarite_model.dart';
import '../shop_layout/Home_screen.dart';
import '../shop_layout/categories_screen.dart';
import '../shop_layout/favarite_screen.dart';
import '../shop_layout/setting_screen.dart';

class ShopProvider extends ChangeNotifier {
  ShopProvider() {
    getHomeData();
    getCategoriesData();
    getUserData();
    updateUserData();
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

  /////******************************************////
  List<BannersModel> Banners = [];
  List<ProductsModel> Products = [];
  List<DataModel> Categories = [];
  Map<int, bool> favarites = {};

  getHomeData() async {
    HomeModel homeModel = await DioHelper.dioHelper.getHomeData();
    Products.addAll(homeModel.data!.products!.toList());
    Banners.addAll(homeModel.data!.banners!.toList());
    homeModel.data!.products!.forEach((element) {
      favarites.addAll({
        element.id!: element.inFavorites!,
      });
    });
    log(favarites.toString());
    notifyListeners();
  }

  getCategoriesData() async {
    CategoriesModel categoriesModel =
        await DioHelper.dioHelper.getCategoriesData();
    Categories.addAll(categoriesModel.data!.data!.toList());
    notifyListeners();
  }

  ChangeFavorites(int productId) async {
    // favarites[productId] = !(favarites![productId!]);
    // notifyListeners();
    ChangeFavoritesModel changeFavoritesModel =
        await DioHelper.dioHelper.ChangeFavorites(productId);
    //favarites.addAll(changeFavoritesModel);
    notifyListeners();
  }

  //////////////////////*******profile********//////////////////////////
  TextEditingController nameProfileController = TextEditingController();
  TextEditingController emailProfileController = TextEditingController();
  TextEditingController phoneProfileController = TextEditingController();
  GlobalKey<FormState> profileKey = GlobalKey<FormState>();
 late LoginModel userModel;

  getUserData() async {
    userModel = await DioHelper.dioHelper.getUserData();
    notifyListeners();
  }

  updateUserData() async {
    userModel = await DioHelper.dioHelper.UpdateUserData(
        nameProfileController.text,
        emailProfileController.text,
        phoneProfileController.text);
    notifyListeners();
  }
//////////////////////**********************//////////////////////////
}
