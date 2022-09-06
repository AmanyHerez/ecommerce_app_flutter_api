import 'dart:developer';

import 'package:final_gsg_app_flutter/shop_app/data/dio_helper.dart';
import 'package:final_gsg_app_flutter/shop_app/models/search_model.dart';
import 'package:final_gsg_app_flutter/shop_app/view/auth_screen/widget/custome_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/shop_provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('search')),
      body: Consumer<ShopProvider>(
        builder: (context, provider, child) {
          return Form(
            key: provider.searchKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  CustomTextfield(
                    textInputType: TextInputType.text,
                    suffix: Icon(Icons.search),
                    title: 'search',
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Write Your Search Hint Word';
                        }
                        return null;
                      },
                      controller: provider.searchController,
                    onChanged: (String text){
                      //provider.Search();
                      DioHelper.dioHelper.Search(text);
                      log(text);
                    },

                  ),
                  SizedBox(height: 20,),
                 // if(provider.searchKey.currentState!.validate())
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context,index)=>
                          buildListProduct(provider.searchModel!.data!.data![index],isOldPrice: false),
                      separatorBuilder: (context,index)=>
                          Divider(thickness: 2,),
                      itemCount: provider.searchModel!.data!.data!.length,
                    ),
                  ),
                ],

              ),
            ),
          );
        },
      ),
    );
  }
}
Widget buildListProduct(Product
    model,

    {bool? isOldPrice=true,
    })=>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model.image!),
                  width: 120,
                  height: 120,
                ),
                if (model.discount != 0 &&isOldPrice! )
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        'DISCOUNT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.0,
                        ),
                      ),
                    ),
                    color: Colors.red,
                  ),
              ],
            ),
            SizedBox(width: 20,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      height: 1.3,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        '${model.price.round()}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      if (model.discount != 0&&isOldPrice!)
                        Text(
                          '${model.oldPrice.round()}',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Spacer(),
                      // IconButton(
                      //   alignment: AlignmentDirectional.bottomEnd,
                      //   onPressed: () {
                      //     ShopCubit.get(context).changeFavorites(model.id!);
                      //   },
                      //   icon: CircleAvatar(
                      //     radius: 15.0,
                      //     backgroundColor:
                      //     ShopCubit.get(context).favorites[model.id] == true
                      //         ? defaultColor
                      //         : Colors.grey,
                      //     child: Icon(
                      //       Icons.favorite_border,
                      //       size: 14.0,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );