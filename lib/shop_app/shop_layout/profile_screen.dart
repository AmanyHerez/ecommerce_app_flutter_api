import 'package:final_gsg_app_flutter/shop_app/data/sp_helper.dart';
import 'package:final_gsg_app_flutter/shop_app/provider/shop_provider.dart';
import 'package:final_gsg_app_flutter/shop_app/router/router.dart';
import 'package:final_gsg_app_flutter/shop_app/shop_layout/profile_screen.dart';
import 'package:final_gsg_app_flutter/shop_app/shop_layout/setting_screen.dart';
import 'package:final_gsg_app_flutter/shop_app/shop_layout/update_profile_screen.dart';
import 'package:final_gsg_app_flutter/shop_app/view/auth_screen/login_screen.dart';
import 'package:final_gsg_app_flutter/shop_app/view/auth_screen/widget/custome_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/dio_helper.dart';
import 'faqs_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 200 / 2),

                      child: Container(
                        width: double.infinity,

                        height: 280,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20),

                        ),
                      ),
                    ),
                    Positioned(
                      top: 280 - 144 / 2,
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color:Colors.white,
                              width: 10,
                            )
                           ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 150 / 2,
                          backgroundImage: NetworkImage(
                              provider!.profileModel!.data!.image!),
                        ),
                      ),
                    ),
                  ]),
              Center(
                  child: Text(
                provider!.profileModel!.data!.name!,
                style: TextStyle(
                  fontSize: 28,
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                provider!.profileModel!.data!.email!,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 2,
              ),
              InkWell(
                onTap: () {
                  AppRouter.NavigateToWidget(UpdateProfileScreen());
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 30,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  provider.Setting();
                  AppRouter.NavigateToWidget(SettingScreen());
                },
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(
                    'Setting',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  provider.FAQs();
                  AppRouter.NavigateToWidget(FaqsScreen());
                },
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(
                    'FQA',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    provider.isDark ? Icons.brightness_2 : Icons.wb_sunny,
                    size: 30,
                    color: provider.isDark ? Colors.white : Colors.amber,
                  ),
                  Expanded(
                    child: SwitchListTile(
                        title: provider.isDark
                            ? Text(
                                'dark mode',
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              )
                            : Text(
                                'light mode',
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                        value: provider.isDark,
                        onChanged: (value) {
                          provider.changeThemaMode(value);
                        }),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  SpHelper.spHelper.deleteToken();
                  AppRouter.NavigateWithReplacemtnToWidget(LoginScreen());
                },
                child: ListTile(
                  leading: Icon(Icons.login_outlined),
                  title: Text(
                    'Logout',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
