import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/category_product_model.dart';
import '../provider/shop_provider.dart';
class CategoryProductScreen extends StatelessWidget {
  const CategoryProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Consumer<ShopProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ListView.separated(
                itemBuilder: (context, index) =>
                provider.SelectedCategoryProduct==null?Center(child: CircularProgressIndicator()):
                    CategoryProductWidget(provider.SelectedCategoryProduct!.data!.data![index]),
                separatorBuilder: (context, index) => Divider(
                  height: 2,
                  color: Colors.grey,
                ),
                itemCount: 1),
          );
        },

      ),
    );
  }
}

Widget CategoryProductWidget(CategoryProductData model)=>
   Consumer<ShopProvider>(builder: (context, provider, child) {
     return Center(
       child: Column(children: [
         Text(model.name!),
       ],),
     );
   },) ;
