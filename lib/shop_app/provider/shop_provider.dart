import 'dart:developer';

import 'package:final_gsg_app_flutter/shop_app/data/dio_helper.dart';
import 'package:final_gsg_app_flutter/shop_app/data/sp_helper.dart';
import 'package:final_gsg_app_flutter/shop_app/models/categories_model.dart';
import 'package:final_gsg_app_flutter/shop_app/models/favorite_model.dart';
import 'package:final_gsg_app_flutter/shop_app/models/home_model.dart';
import 'package:final_gsg_app_flutter/shop_app/models/login_model.dart';
import 'package:final_gsg_app_flutter/shop_app/models/product_details_model.dart';
import 'package:final_gsg_app_flutter/shop_app/models/search_model.dart';
import 'package:final_gsg_app_flutter/shop_app/router/router.dart';
import 'package:final_gsg_app_flutter/shop_app/view/auth_screen/login_screen.dart';
import 'package:flutter/material.dart';

import '../models/category_product_model.dart';
import '../models/change_favarite_model.dart';
import '../models/faq_model.dart';
import '../models/setting_model.dart';
import '../shop_layout/Home_screen.dart';
import '../shop_layout/categories_screen.dart';
import '../shop_layout/favarite_screen.dart';
import '../shop_layout/profile_screen.dart';


class ShopProvider extends ChangeNotifier {
  ShopProvider() {
    getHomeData();
    getCategoriesData();
    getUserData();
    //updateUserData();
    //Search();
    getFavorites();
  }

//************ bottom navigation bar *************//
  int currentIndex = 0;
  List<Widget> BnScreen = [
    HomeScreen(),
    CategoriesScreen(),
    FavariteScreen(),
    ProfileScreen(),
  ];

  chagebottomNavigationBar(int index) {
    currentIndex = index;
    notifyListeners();
  }
  //////////////////////*******theme mode********//////////////////////
 bool isDark=false;
  changeThemaMode(bool value){
    isDark=value;
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
/////////////****************Categories*****************/////////////////
  getCategoriesData() async {
    CategoriesModel categoriesModel =
        await DioHelper.dioHelper.getCategoriesData();
    Categories.addAll(categoriesModel.data!.data!.toList());
    notifyListeners();
  }
  ///////////////////********category product**********//////////////////////
  CategoryProductModel? SelectedCategoryProduct;
  getCategoriesProduct(int id) async {
    SelectedCategoryProduct = null;
    notifyListeners();
    SelectedCategoryProduct =
    await DioHelper.dioHelper.getCategoryProduct(id);
    notifyListeners();
  }
  // /////////////////******* changeFavorites***********//////////////////////

  ChangeFavoritesModel? changeFavoritesModel;

  ChangeFavorites(int productId) async {
    favarites[productId] = !favarites[productId!]!;
    notifyListeners();
    changeFavoritesModel = await DioHelper.dioHelper.ChangeFavorites(productId);
    if (!changeFavoritesModel!.status!) {
      favarites[productId] = !favarites[productId!]!;
    } else {
      getFavorites();
      notifyListeners();
    }

    notifyListeners();
  }
  // /////////////////******* Favorites***********//////////////////////
  FavoritesModel? favoritesModel;

  // List<FavoritesData> getFav=[];
  getFavorites() async {
    favoritesModel = await DioHelper.dioHelper.getFavorites();
    //getFav.addAll(favoritesModel.data!.data!.toList());

    notifyListeners();
  }

  /////////////////////////*****product Details*******/////////////////////////
  ProductDetailsModel? selectedProduct;

  ProductDetails(int id) async {
    selectedProduct = null;
    notifyListeners();
    selectedProduct = await DioHelper.dioHelper.ProductDetails(id);
    notifyListeners();
  }

  //////////////////////*******profile********//////////////////////////
  TextEditingController nameProfileController = TextEditingController();
  TextEditingController emailProfileController = TextEditingController();
  TextEditingController phoneProfileController = TextEditingController();
  GlobalKey<FormState> profileKey = GlobalKey<FormState>();
   LoginModel? profileModel;

  getUserData() async {
    profileModel = await DioHelper.dioHelper.getUserData();
    notifyListeners();
  }

  updateUserData() async {
    profileModel = await DioHelper.dioHelper.UpdateUserData(
        nameProfileController.text,
        emailProfileController.text,
        phoneProfileController.text);
    notifyListeners();
  }

//////////////////////*******search**********//////////////////////////
  TextEditingController searchController = TextEditingController();
  GlobalKey<FormState> searchKey = GlobalKey<FormState>();
  SearchModel? searchModel;

  Search(String text) async {
   searchModel = await DioHelper.dioHelper.Search(text);
    notifyListeners();
  }
//////////////////////*******setting**********//////////////////////////
  SettingsModel? settingsModel;
  Setting() async {
    searchModel = await DioHelper.dioHelper.getSettings();
    notifyListeners();
  }
//////////////////////*******FQA**********//////////////////////////
  FAQsModel? faQsModel;
  FAQs() async {
    faQsModel = await DioHelper.dioHelper.getFAQs();
    notifyListeners();
  }
}
