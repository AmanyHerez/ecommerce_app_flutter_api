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
    sharedPreferences!.remove('token');
  }
}