import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/setting_model.dart';
import '../provider/shop_provider.dart';
class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProvider>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(title: Text('setting'),

        ),
body: Consumer<ShopProvider>(builder: (context, Provider, child) {
  return ListView(children: [

  ],);
},),
      );
    },);
  }
}
