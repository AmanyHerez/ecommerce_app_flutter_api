import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:final_gsg_app_flutter/shop_app/constant/constant.dart';
import 'package:final_gsg_app_flutter/shop_app/data/sp_helper.dart';
import 'package:final_gsg_app_flutter/shop_app/models/add_cart_model.dart';
import 'package:final_gsg_app_flutter/shop_app/models/categories_model.dart';
import 'package:final_gsg_app_flutter/shop_app/models/favorite_model.dart';
import 'package:final_gsg_app_flutter/shop_app/models/home_model.dart';
import 'package:final_gsg_app_flutter/shop_app/models/login_model.dart';
import 'package:final_gsg_app_flutter/shop_app/models/search_model.dart';

import '../models/category_product_model.dart';
import '../models/change_favarite_model.dart';
import '../models/faq_model.dart';
import '../models/product_details_model.dart';
import '../models/setting_model.dart';

class DioHelper {
  DioHelper._();

  static DioHelper dioHelper = DioHelper._();
  Dio dio = Dio();

  // Dio(BaseOptions(
  //     baseUrl: 'https://student.valuxapps.com/api/',
  //     receiveDataWhenStatusError: true,
  //     headers: {
  //       'Content-Type': 'application/json',
  //     }));

  login(String email, String password) async {
    // String baseUrl='https://student.valuxapps.com/api/';
    // String userEndPoint = 'login';
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.userEndPoint);
    Map<String, dynamic> mapData = {
      'email': email,
      'password': password,
    };
    Map<String, dynamic> mapHeaders = {
      'lang': 'en',
      'Content-Type': 'application/json',
    };

    Response response = await dio.post(url.toString(),
        data: mapData, options: Options(headers: mapHeaders));
    LoginModel loginModel = LoginModel.fromJson(response.data);
    //print(response.data);
    // print(" token :${loginModel.data!.token}");
    //print(response.data['data']);

    return loginModel.data!.token;
    //return response.data['token'];
  }

  Register(String name, String email, String password, String phone) async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.registerEndPoint);
    Map<String, dynamic> mapData = {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
    };
    Map<String, dynamic> mapHeaders = {
      'lang': 'en',
      'Content-Type': 'application/json',
    };

    Response response = await dio.post(url.toString(),
        data: mapData, options: Options(headers: mapHeaders));
    LoginModel loginModel = LoginModel.fromJson(response.data);
    print(response.data);
    // print(" token :${loginModel.data!.token}");
    //print(response.data['data']);

    return loginModel;
  }

  getHomeData() async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.homeEndPoint);
    Map<String, dynamic> mapHeaders = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': '${SpHelper.spHelper.getToken()} '
      // 'Authorization':
      //     'b676yF4HQTAGtP9bYNM2kjAw3VZ6vd63Ar7dr7jQvhISokVKIK5K3Emr4tiPctOBgBlZhV'
    };

    Response response =
        await dio.get(url.toString(), options: Options(headers: mapHeaders));
    HomeModel homeModel = HomeModel.fromJson(response.data);

    print(homeModel.status);
    print(homeModel.data!.banners![0].image);
    return homeModel;
  }

  getCategoriesData() async {
    var url =
        Uri.parse(ApiConstants.baseUrl + ApiConstants.getCategoriesEndPoint);
    Map<String, dynamic> mapHeaders = {
      'lang': 'en',
    };

    Response response =
        await dio.get(url.toString(), options: Options(headers: mapHeaders));
    CategoriesModel categoriesModel = CategoriesModel.fromJson(response.data);

    print(categoriesModel.status);
    //print(categoriesModel.data!.data![0]);
    return categoriesModel;
  }

  //////////////////////////**********category product******////////////////////////////
  // getCategoryProduct() async {
  //   var url = Uri.parse(
  //       ApiConstants.baseUrl + ApiConstants. CategoryproductEndPoint );
  //   Map<String, dynamic> mapHeaders = {
  //     'lang': 'en',
  //     'Authorization':
  //     'b676yF4HQTAGtP9bYNM2kjAw3VZ6vd63Ar7dr7jQvhISokVKIK5K3Emr4tiPctOBgBlZhV'
  //   };
  //   Map<String, dynamic> mapQuery = {
  //     'category_id':44,
  //   };
  //
  //   Response response =
  //   await dio.get(url.toString(), options: Options(headers: mapHeaders,),queryParameters: mapQuery);
  //   CategoryProductModel categoryProductModel =
  //   CategoryProductModel.fromJson(response.data);
  //
  //   print(categoryProductModel.status);
  //   print(categoryProductModel.data!.total);
  //
  //   return categoryProductModel;
  // }
  getCategoryProduct(int id) async {
    var url =
        Uri.parse(ApiConstants.baseUrl + ApiConstants.CategoryproductEndPoint);
    Map<String, dynamic> mapHeaders = {
      'lang': 'en',
      'Authorization': '${SpHelper.spHelper.getToken()} '
      // 'Authorization':
      // 'b676yF4HQTAGtP9bYNM2kjAw3VZ6vd63Ar7dr7jQvhISokVKIK5K3Emr4tiPctOBgBlZhV'
    };
    Map<String, dynamic> mapQuery = {
      'category_id': id,
    };
    Response response = await dio.get(url.toString(),
        options: Options(headers: mapHeaders), queryParameters: mapQuery);
    CategoryProductModel categoryProductModel =
        CategoryProductModel.fromJson(response.data);

    print(categoryProductModel.status);
    //print(categoryProductModel.data!.total);

    return categoryProductModel;
  }

  //////////////////////////**********product Details******////////////////////////////
  ProductDetails(int id) async {
    var url = Uri.parse(
        ApiConstants.baseUrl + ApiConstants.productDetailsEndPoint + "$id");
    Map<String, dynamic> mapHeaders = {
      'lang': 'en',
      'Authorization': '${SpHelper.spHelper.getToken()} '
      // 'Authorization':
      //     'b676yF4HQTAGtP9bYNM2kjAw3VZ6vd63Ar7dr7jQvhISokVKIK5K3Emr4tiPctOBgBlZhV'
    };

    Response response =
        await dio.get(url.toString(), options: Options(headers: mapHeaders));
    ProductDetailsModel productDetailsModel =
        ProductDetailsModel.fromJson(response.data);

    print(productDetailsModel.status);
    //print(productDetailsModel.data!.name);

    return productDetailsModel;
  }

///////////////************ ChangeFavorites**************//////////////////////////////
  ChangeFavorites(int productId) async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.favoritesEndPoint);
    Map<String, dynamic> mapHeaders = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': '${SpHelper.spHelper.getToken()} '
      // 'Authorization':
      //     '3mJAj2csMpQfNDWgNyamCI1c5ghU9iOapQJUz8zV5uBtRx6sl9rIfWRMhsQx3fnQesq3C7'
    };
    Map<String, dynamic> mapData = {
      'product_id': productId,
    };

    Response response = await dio.post(url.toString(),
        data: mapData, options: Options(headers: mapHeaders));
    ChangeFavoritesModel changeFavoritesModel =
        ChangeFavoritesModel.fromJson(response.data);

    print(changeFavoritesModel.status);
    print(changeFavoritesModel.message);
    return changeFavoritesModel;
  }

  getFavorites() async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.favoritesEndPoint);
    Map<String, dynamic> mapHeaders = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': '${SpHelper.spHelper.getToken()} '
      // 'Authorization':
      //     'MsBbAUSmykMklVsbxN9CE2uq0tCnuWofNhZr6UsLr3B5ho8b5TjEMobZ0g8wkqieh6UYeP'
    };

    Response response =
        await dio.get(url.toString(), options: Options(headers: mapHeaders));
    FavoritesModel favoritesModel = FavoritesModel.fromJson(response.data);

    print(favoritesModel.status);
    print(favoritesModel.data.toString());
    print(favoritesModel.data!.data!.length.toString());
    return favoritesModel;
  }

//////////////////////*********profile*************/////////////////////////////
  getUserData() async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.profileEndPoint);
    Map<String, dynamic> mapHeaders = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': '${SpHelper.spHelper.getToken()} '
      // 'Authorization':
      //     'MEzM2zbFKrfA8Y99v2XhXdSgY06M1i5mV5lqUmB1uq9WPhOLmRRvkCrDi8rvXaicdSOKfw'
    };

    Response response =
        await dio.get(url.toString(), options: Options(headers: mapHeaders));
    LoginModel profileModel = LoginModel.fromJson(response.data);

    print(profileModel.data?.name);

    return profileModel;
  }

//////////////////////*********Update*************/////////////////////////////
  UpdateUserData(String name, String email, String phone) async {
    var url =
        Uri.parse(ApiConstants.baseUrl + ApiConstants.updateProfileEndPoint);
    Map<String, dynamic> mapHeaders = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': '${SpHelper.spHelper.getToken()} '
      // 'Authorization':
      //     'JPDMBsWT6LOdjjwM8I3xhdUkjAHgCqP2r61uakOiBcwHkr6AUpk9ubECYwlahWlTX0NMC4'
    };
    Map<String, dynamic> mapData = {
      'name': name,
      'email': email,
      'phone': phone,
    };

    Response response = await dio.put(
      url.toString(),
      options: Options(headers: mapHeaders),
      data: mapData,
    );
    LoginModel userModel = LoginModel.fromJson(response.data);

    print(userModel.message);

    print(userModel.data?.email);
    print(userModel.data?.name);
    print(userModel.data?.phone);

    return userModel;
  }

  // UpdateUserData() async {
  //   var url =
  //   Uri.parse(ApiConstants.baseUrl + ApiConstants.updateProfileEndPoint);
  //   Map<String, dynamic> mapHeaders = {
  //     'lang': 'en',
  //     'Content-Type': 'application/json',
  //     'Authorization':'${SpHelper.spHelper.getToken()} '
  //     // 'Authorization':
  //     //     'JPDMBsWT6LOdjjwM8I3xhdUkjAHgCqP2r61uakOiBcwHkr6AUpk9ubECYwlahWlTX0NMC4'
  //   };
  //   Map<String, dynamic> mapData = {
  //     'email':'amanyH@gmail.com',
  //     'name': 'Amany Amany Herez',
  //     'password': 'AmanyH@gmail.com',
  //     'phone': '0592427427',
  //   };
  //
  //   Response response = await dio.put(
  //     url.toString(),
  //     options: Options(headers: mapHeaders),
  //     data: mapData,
  //   );
  //   LoginModel userModel = LoginModel.fromJson(response.data);
  //
  //   print(userModel.message);
  //   print(userModel.data?.name);
  //   print(userModel.data?.email);
  //
  //
  //   return userModel;
  // }
////////////////*****************Search**************/////////////////////////
  Search(String text) async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.searchEndPoint);
    Map<String, dynamic> mapHeaders = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': '${SpHelper.spHelper.getToken()} '
      // 'Authorization':
      //     'kiJezAsbXXrIpBf45FdagfiD79nnC36baWhBbogmqQ0WYlpD0ZQN9vJ2UroldItUnbnmMx'
    };
    Map<String, dynamic> mapData = {
      'text': text,
    };

    Response response = await dio.post(url.toString(),
        data: mapData, options: Options(headers: mapHeaders));
    SearchModel searchModel = SearchModel.fromJson(response.data);

    print(searchModel.status);
    print(searchModel.message);
    print(searchModel.data!.data!.length);
    return searchModel;
  }

  /////////////////////*********setting**********/////////////////////////
  getSettings() async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.settingsEndPoint);
    Map<String, dynamic> mapHeaders = {
      'lang': 'en',
      //'Content-Type': 'application/json',
    };

    Response response =
        await dio.get(url.toString(), options: Options(headers: mapHeaders));
    SettingsModel settingsModel = SettingsModel.fromJson(response.data);
    //print('Get FAQs ' + faqModel.status.toString());
    print(settingsModel.status);
    print(settingsModel.data!.about);

    return settingsModel;
  }

  /////////////////////*********FAQs **********/////////////////////////
  getFAQs() async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.faqsEndPoint);
    Map<String, dynamic> mapHeaders = {
      'lang': 'en',
      //'Content-Type': 'application/json',
    };

    Response response =
        await dio.get(url.toString(), options: Options(headers: mapHeaders));
    FAQsModel faQsModel = FAQsModel.fromJson(response.data);
    //print('Get FAQs ' + faqModel.status.toString());
    print(faQsModel.status);
    print(faQsModel.data!.total.toString());
    print(faQsModel.data!.data![1].question);

    return faQsModel;
  }

  ////////////********************add cart & delete***********//////////
  AddToCart(int productId) async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.cartsEndPoint);
    Map<String, dynamic> mapHeaders = {
      'lang': 'ar',
      'Content-Type': 'application/json',
      'Authorization': '${SpHelper.spHelper.getToken()} '
    };
    Map<String, dynamic> mapData = {
      'product_id': productId,
    };
    Response response = await dio.post(url.toString(),
        options: Options(
          headers: mapHeaders,
        ),
        data: mapData);
    AddCartModel addCartModel = AddCartModel.fromJson(response.data);
    log("cart");
    log(addCartModel.status.toString());
    log(addCartModel.message!);
    log(addCartModel.data!.product!.name!);
    return addCartModel;
  }
}
