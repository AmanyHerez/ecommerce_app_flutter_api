import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {

  SpHelper._();
  static SpHelper spHelper = SpHelper._();
  SharedPreferences? sharedPreferences;
  initSp() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  SaveToken(String token){
    sharedPreferences!.setString('token', token);
  }
  String? getToken(){
    return sharedPreferences!.getString('token');
  }
  deleteToken(){
    sharedPreferences!.remove('N35COQWHilCMrbh7Yd6EK0IP9bjVXaF87x9MhaF7SdXTlwZ6E6IFhxUTIrw1n482FhbCZj');
  }
}