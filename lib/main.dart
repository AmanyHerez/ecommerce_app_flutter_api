import 'package:final_gsg_app_flutter/shop_app/data/sp_helper.dart';
import 'package:final_gsg_app_flutter/shop_app/provider/auth_provider.dart';
import 'package:final_gsg_app_flutter/shop_app/provider/shop_provider.dart';
import 'package:final_gsg_app_flutter/shop_app/router/router.dart';
import 'package:final_gsg_app_flutter/shop_app/shop_layout/shop_layout_screen.dart';
import 'package:final_gsg_app_flutter/shop_app/testing_screen.dart';
import 'package:final_gsg_app_flutter/shop_app/view/auth_screen/login_screen.dart';
import 'package:final_gsg_app_flutter/shop_app/view/auth_screen/register_screen.dart';
import 'package:final_gsg_app_flutter/shop_app/view/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SpHelper.spHelper.initSp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ShopProvider>(create: (context){
          return ShopProvider();
        }),ChangeNotifierProvider<AuthProvider>(create: (context){
          return AuthProvider();
        }),
      ],
      child: Consumer<ShopProvider>(
        builder: (context, provider, child) {
         return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: AppRouter.navKey,
            theme: provider.isDark ?ThemeData.dark():ThemeData.light(),


            home:TestingScreen(),
          );
        },

      ),
    );
  }
}
