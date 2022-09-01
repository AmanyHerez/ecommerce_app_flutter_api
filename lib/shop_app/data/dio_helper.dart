import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:final_gsg_app_flutter/shop_app/constant/constant.dart';

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
    //String email, String password
    String baseUrl='https://student.valuxapps.com/api/';
    String userEndPoint = 'login';
    var url=Uri.parse(baseUrl+userEndPoint) ;
    Map<String, dynamic> mapData = {
      'email': email,
      'password': password,
      // 'email': 'amanyH@gmail.com',
      // 'password': '123456',
    };
    Map<String, dynamic> mapHeaders = {
      'lang': 'ar',
      'Content-Type': 'application/json',
    };

    Response response = await dio.post(
      url.toString(),
      data: mapData,
        options: Options(headers: mapHeaders)
      //queryParameters: map,

    );
    print(response.data);
    return response.data!['email'];
  }
}
