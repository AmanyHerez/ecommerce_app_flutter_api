import 'package:final_gsg_app_flutter/shop_app/shop_layout/shop_layout_screen.dart';
import 'package:final_gsg_app_flutter/shop_app/view/auth_screen/login_screen.dart';
import 'package:flutter/material.dart';

import '../data/sp_helper.dart';
import '../router/router.dart';
class SplachScreen extends StatefulWidget {


  @override

  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigationFun();
  }
  navigationFun()async{
    await Future.delayed(Duration(seconds: 3));
    String? token=await SpHelper.spHelper.getToken();
    if(token==null){
      AppRouter.NavigateWithReplacemtnToWidget(LoginScreen());
    }
    else{
      AppRouter.NavigateWithReplacemtnToWidget(ShopLayout());
    }
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splach Screen'),
      ),
    );
  }
}
