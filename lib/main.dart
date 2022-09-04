import 'package:final_gsg_app_flutter/shop_app/provider/auth_provider.dart';
import 'package:final_gsg_app_flutter/shop_app/provider/shop_provider.dart';
import 'package:final_gsg_app_flutter/shop_app/router/router.dart';
import 'package:final_gsg_app_flutter/shop_app/shop_layout/shop_layout_screen.dart';
import 'package:final_gsg_app_flutter/shop_app/view/auth_screen/login_screen.dart';
import 'package:final_gsg_app_flutter/shop_app/view/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: AppRouter.navKey,
        home: ShopLayout(),
      ),
    );
  }
}
