import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/setting_model.dart';
import '../provider/shop_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              "Setting",
              style: TextStyle(color: Colors.black,fontSize: 30),
            ),
          ),
          body: Consumer<ShopProvider>(
            builder: (context, provider, child) {
              return provider.settingsModel == null
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: ListView(
                        children: [
                          Text('About :',style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),),
                          SizedBox(height: 10,),
                          Text(provider.settingsModel!.data!.about!,style: TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            fontWeight: FontWeight.w500,
                          ),),
                          SizedBox(height: 10,),
                          Divider(height: 4,thickness: 2,),
                          SizedBox(height: 10,),
                          Text('terms :',style: TextStyle(
                            fontSize: 22,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(height: 10,),
                          Expanded(
                            child: Text(provider.settingsModel!.data!.terms!,style: TextStyle(
                              fontSize: 16,
                             height: 1.5,
                              fontWeight: FontWeight.w500,
                            ),),
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                  );
            },
          ),
        );
      },
    );
  }
}
