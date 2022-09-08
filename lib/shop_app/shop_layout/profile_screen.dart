import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/shop_provider.dart';
import '../view/auth_screen/widget/custome_textfield.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ShopProvider>(

        builder: (context, provider, child) {
          var model=provider.profileModel;
          provider.nameProfileController.text  = model!.data!.name!;
          provider.emailProfileController.text=model.data!.email!;
          provider.phoneProfileController.text=model.data!.phone!;
          return Form(
            key: provider.profileKey,
            child:provider.profileModel==null?Center(child: CircularProgressIndicator()): Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                children: [
                  CustomTextfield(
                    validator: (String value) {
                      if(value.isEmpty){
                        return 'name must not be empty ';
                      }
                      return null;
                    },
                    controller: provider.nameProfileController,
                    title: 'name',
                  ),
                  SizedBox(height: 20,),
                  CustomTextfield(
                    validator: (String value) {
                      if(value.isEmpty){
                        return 'email must not be empty ';
                      }
                      return null;
                    },
                    controller: provider.emailProfileController,
                    title: 'email',
                  ),
                  SizedBox(height: 20,),
                  CustomTextfield(
                    validator: (String value) {
                      if(value.isEmpty){
                        return 'phone must not be empty ';
                      }
                      return null;
                    },
                    controller: provider.phoneProfileController,
                    title: 'phone',
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){
                    // if(provider.profileKey.currentState!.validate()){
                    //   provider.updateUserData();
                    // }
                  }, child: Text('update')),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
