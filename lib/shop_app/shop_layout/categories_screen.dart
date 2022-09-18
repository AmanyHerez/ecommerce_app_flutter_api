import 'package:final_gsg_app_flutter/shop_app/data/dio_helper.dart';
import 'package:final_gsg_app_flutter/shop_app/models/categories_model.dart';
import 'package:final_gsg_app_flutter/shop_app/provider/shop_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../router/router.dart';
import 'category_product_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView.separated(
              itemBuilder: (context, index) =>
                  InkWell(
                    onTap: (){
                      provider.getCategoriesProduct(provider.Categories[index].id!);
                      //AppRouter.NavigateToWidget(CategoryProductScreen());
                    },
                      child: bulidCatItem(provider.Categories[index])),
              separatorBuilder: (context, index) => Divider(
                height: 2,
                color: Colors.grey,
              ),
              itemCount: provider.Categories.length),
        );
      },
    );
  }
}

Widget bulidCatItem(DataModel model) => Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    children: [
      Image(
        image: NetworkImage(model.image!),
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      ),
      SizedBox(
        width: 20,
      ),
      Text(
        model.name!,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      Spacer(),
      Icon(Icons.arrow_forward_ios)
    ],
  ),
);