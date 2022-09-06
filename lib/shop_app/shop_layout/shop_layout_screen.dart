import 'package:final_gsg_app_flutter/shop_app/data/dio_helper.dart';
import 'package:final_gsg_app_flutter/shop_app/data/sp_helper.dart';
import 'package:final_gsg_app_flutter/shop_app/provider/auth_provider.dart';
import 'package:final_gsg_app_flutter/shop_app/provider/shop_provider.dart';
import 'package:final_gsg_app_flutter/shop_app/router/router.dart';
import 'package:final_gsg_app_flutter/shop_app/shop_layout/Home_screen.dart';
import 'package:final_gsg_app_flutter/shop_app/shop_layout/categories_screen.dart';
import 'package:final_gsg_app_flutter/shop_app/shop_layout/favarite_screen.dart';
import 'package:final_gsg_app_flutter/shop_app/shop_layout/search_screen.dart';
import 'package:final_gsg_app_flutter/shop_app/shop_layout/setting_screen.dart';
import 'package:final_gsg_app_flutter/shop_app/view/auth_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ShopLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(actions: [
            IconButton(onPressed: (){
              //SpHelper.spHelper.deleteToken();
              AppRouter.NavigateToWidget(SearchScreen());
        }, icon: Icon(Icons.search))
          ],),
          body:provider.BnScreen[provider.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type:BottomNavigationBarType.fixed,
            currentIndex:provider.currentIndex ,
            onTap: provider.chagebottomNavigationBar,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home ',),
              BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Categories ',),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined),label: 'Favorite ',),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: ' Settings',),
            ],
          ),
        );
      },

    );
  }
}