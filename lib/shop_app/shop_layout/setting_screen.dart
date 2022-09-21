import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/shop_provider.dart';
class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProvider>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(title: Text('setting'),),
      );
    },);
  }
}
