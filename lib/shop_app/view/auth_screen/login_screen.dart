import 'dart:developer';

import 'package:final_gsg_app_flutter/shop_app/data/dio_helper.dart';
import 'package:final_gsg_app_flutter/shop_app/provider/shop_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ShopProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.asset('asset/image/logo.png',width: 157,height: 109,)),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Welcome!'),
                    SizedBox(
                      height: 20,
                    ),
                    Text('please login or sign up to continue our app'),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Email'),
                    TextFormField(
                      controller: provider.emailController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('password'),
                    TextFormField(
                      obscureText: provider.isObscure,
                      controller: provider.passwordController,
                      decoration: InputDecoration(

                        suffix: IconButton(
                          onPressed: (){
                            provider.changeVisiblityPassword();
                          },
                          icon:Icon(provider.suffix),
                        ),

                      ),
                    ),
                    SizedBox(height: 30,),
                    ElevatedButton(onPressed: ()async{
                     await DioHelper.dioHelper.login( provider.emailController .text,provider.passwordController.text,);

                      // String? token=await DioHelper.dioHelper.login();
                      // log(token ?? ' empty');
                    }, child: Text('login')
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
