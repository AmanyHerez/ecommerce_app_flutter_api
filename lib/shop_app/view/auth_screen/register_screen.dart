import 'package:final_gsg_app_flutter/shop_app/view/auth_screen/login_screen.dart';
import 'package:final_gsg_app_flutter/shop_app/view/auth_screen/widget/custome_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../../router/router.dart';
import '../../shop_layout/shop_layout_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: provider.RegisterKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Image.asset(
                        'asset/image/logo.png',
                        width: 157,
                        height: 109,
                      )),
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
                      Text('Name'),
                      CustomTextfield(
                        controller: provider.nameController,
                        validator: provider.nullValidation,
                        textInputType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Email'),
                      CustomTextfield(
                        controller: provider.emailRegController,
                        validator: provider.emailValidation,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('password'),
                      CustomTextfield(
                        controller: provider.passwordRegController,
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
                        height: 20,
                      ),
                      Text('phone Number'),
                      CustomTextfield(
                        controller: provider.phoneController,
                        validator: provider.nullValidation,
                        textInputType: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 20,
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
                            // await provider.login();
                            if (provider.RegisterKey.currentState!.validate()) {
                              provider.Register();
                              AppRouter.NavigateWithReplacemtnToWidget(
                                  ShopLayout());
                            }
                          },
                          child: Text('Register',style: TextStyle(fontSize: 18,),),
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
                          Text("Do you have an acount?"),
                          InkWell(
                            onTap: (){AppRouter.NavigateToWidget(LoginScreen());},
                            child: Text('login',style:TextStyle(color: Colors.blue,)),),
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
