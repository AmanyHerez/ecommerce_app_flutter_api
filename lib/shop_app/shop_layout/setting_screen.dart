import 'package:final_gsg_app_flutter/shop_app/provider/shop_provider.dart';
import 'package:final_gsg_app_flutter/shop_app/router/router.dart';
import 'package:final_gsg_app_flutter/shop_app/shop_layout/profile_screen.dart';
import 'package:final_gsg_app_flutter/shop_app/view/auth_screen/widget/custome_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/dio_helper.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProvider>(

      builder: (context, provider, child) {

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(radius: 60,
                backgroundImage:
                     NetworkImage(provider!.profileModel!.data!.image!),

                ),
              ),
              Center(child: Text(provider!.profileModel!.data!.name!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),)),
              Center(child: Text(provider!.profileModel!.data!.email!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),)),
              SizedBox(height: 10,),
              Divider(thickness: 2,),
              InkWell(
                onTap: (){
                  AppRouter.NavigateToWidget(ProfileScreen());
                },
                child: Row(
                 children: [
                   Icon(Icons.person,size: 30,),
                   Text('Profile',style: TextStyle(

                     fontSize: 25,
                   ),),
                 ],
                ),

              ),
              SizedBox(height: 10,),

              Row(
                children: [
                  Icon(provider.isDark ?Icons.brightness_2:Icons.wb_sunny,size: 30,
                    color: provider.isDark ?Colors.white:Colors.amber,),
                  Expanded(
                    child: SwitchListTile(
                        title: provider.isDark ?Text('dark mode',style: TextStyle(

                          fontSize: 25,
                        ),):Text('light mode',style: TextStyle(

                          fontSize: 25,
                        ),),
                        value: provider.isDark, onChanged: (value){
                      provider.changeThemaMode(value);

                    }),
                  ),
                ],
              ),

            ],
          ),
        );
      },
    );
  }
}