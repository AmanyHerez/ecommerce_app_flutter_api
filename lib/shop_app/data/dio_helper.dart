import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:final_gsg_app_flutter/shop_app/constant/constant.dart';
import 'package:final_gsg_app_flutter/shop_app/data/sp_helper.dart';
import 'package:final_gsg_app_flutter/shop_app/models/categories_model.dart';
import 'package:final_gsg_app_flutter/shop_app/models/home_model.dart';
import 'package:final_gsg_app_flutter/shop_app/models/login_model.dart';

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
    var url=Uri.parse(ApiConstants.baseUrl+ApiConstants.userEndPoint) ;
    Map<String, dynamic> mapData = {
      'email': email,
      'password': password,
    };
    Map<String, dynamic> mapHeaders = {
      'lang': 'ar',
      'Content-Type': 'application/json',
    };

    Response response = await dio.post(
      url.toString(),
      data: mapData,
        options: Options(headers: mapHeaders)

    );
    LoginModel loginModel=LoginModel.fromJson(response.data);
    //print(response.data);
   // print(" token :${loginModel.data!.token}");
    //print(response.data['data']);

  return loginModel.data!.token;
   //return response.data['token'];
  }

 getHomeData()async{
    var url=Uri.parse(ApiConstants.baseUrl+ApiConstants.homeEndPoint) ;
    Map<String, dynamic> mapHeaders = {
      'lang': 'ar',
      'Content-Type': 'application/json',
     // 'Authorization':'${SpHelper.spHelper.getToken()} '
      'Authorization':'kDpkeyTwG5WrA3sWNrRArqzO9peEfhn9il9n361ZtjKB3tomh3CFmRTkpw0kHvznHK33gr'
    };

    Response response = await dio.get(
        url.toString(),

        options: Options(headers: mapHeaders)

    );
    HomeModel homeModel=HomeModel.fromJson(response.data);


    print(homeModel.status);
    print(homeModel.data!.banners![0].image );
  return homeModel;
  }
  getCategoriesData()async{
    var url=Uri.parse(ApiConstants.baseUrl+ApiConstants.getCategoriesEndPoint) ;
    Map<String, dynamic> mapHeaders = {
      'lang': 'ar',
    };

    Response response = await dio.get(
        url.toString(),

        options: Options(headers: mapHeaders)

    );
    CategoriesModel categoriesModel=CategoriesModel.fromJson(response.data);


    print(categoriesModel.status);
    //print(categoriesModel.data!.data![0]);
    return categoriesModel;
  }
}
