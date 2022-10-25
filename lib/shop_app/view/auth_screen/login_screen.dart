import 'dart:developer';

import 'package:final_gsg_app_flutter/shop_app/data/dio_helper.dart';
import 'package:final_gsg_app_flutter/shop_app/provider/auth_provider.dart';
import 'package:final_gsg_app_flutter/shop_app/router/router.dart';
import 'package:final_gsg_app_flutter/shop_app/shop_layout/shop_layout_screen.dart';
import 'package:final_gsg_app_flutter/shop_app/view/auth_screen/register_screen.dart';
import 'package:final_gsg_app_flutter/shop_app/view/auth_screen/widget/custome_textfield.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      Center(
                          child: Image.asset(
                        'asset/image/logo.png',
                        width: 157,
                        height: 109,
                      )),
                      SizedBox(
                        height: 40,
                      ),
                      Text('Welcome!'),
                      SizedBox(
                        height: 20,
                      ),
                      Text('please login or sign up to continue our app'),
                      SizedBox(
                        height: 40,
                      ),
                      Text('Email'),
                      CustomTextfield(
                        controller: provider.emailController,
                        validator: provider.emailValidation,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('password'),
                      CustomTextfield(
                        controller: provider.passwordController,
                        validator: provider.passwordValidation,
                        textInputType: TextInputType.text,
                        suffix: IconButton(
                          onPressed: () {
                            provider.changeVisiblityPassword();
                          },
                          icon: Icon(provider.suffix),
                        ),
                        obscureText: provider.isObscure,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            // DioHelper.dioHelper.login( provider.emailController.text,
                            //   provider. passwordController.text,);
                            await provider.login();

                            AppRouter.NavigateWithReplacemtnToWidget(
                                ShopLayout());
                          },
                          child: Text('login',style: TextStyle(fontSize: 18,),),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(20),
                            primary: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text("Don\'t have an acount?"),
                        InkWell(
                          onTap: (){AppRouter.NavigateToWidget(RegisterScreen());},
                            child: Text('Register Now',style:TextStyle(color: Colors.blue)),),
                      ],),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
