import 'package:final_gsg_app_flutter/shop_app/provider/shop_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class FaqsScreen extends StatelessWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProvider>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [

          ],
        ),
      );
    },);
  }
}
