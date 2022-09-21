import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/category_product_model.dart';
import '../provider/shop_provider.dart';
import '../router/router.dart';
import 'details_product_screen.dart';
class CategoryProductScreen extends StatelessWidget {
  String? categoryName;


  CategoryProductScreen(this.categoryName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(categoryName!,style: TextStyle(color: Colors.black),),
      ),

      body:  Consumer<ShopProvider>(
        builder: (context, provider, child) {
          return provider.SelectedCategoryProduct==null?Center(child: CircularProgressIndicator()): Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ListView.separated(
                itemBuilder: (context, index) =>

                    CategoryProductWidget(provider.SelectedCategoryProduct!.data!.data![index]),
                separatorBuilder: (context, index) => Divider(
                  height: 3,
                  color: Colors.grey,
                ),
                itemCount: provider.SelectedCategoryProduct!.data!.data!.length),
          );
        },

      ),
    );
  }
}

Widget CategoryProductWidget(CategoryProductData model)=>
   Consumer<ShopProvider>(builder: (context, provider, child) {
     return InkWell(
       onTap: (){
         provider.ProductDetails(model.id!);
         //print(provider.Products[index].id!.toString());
         AppRouter.NavigateToWidget(ProductDetailsScreen());
       },
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
           color: Colors.white,
           height: 120,
           child: Row(
             children: [
               Stack(alignment: AlignmentDirectional.bottomStart, children: [
                 Image(
                   image: NetworkImage(model.image!),
                   width: 120,
                   height: 120,
                   fit: BoxFit.cover,
                 ),
                 if (model.discount != 0)
                   Container(
                     color: Colors.red,
                     child: Padding(
                       padding: const EdgeInsets.all(2.0),
                       child: Text(
                         'Discount',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 10,
                         ),
                       ),
                     ),
                   ),
               ]),
               SizedBox(
                 width: 20,
               ),
               Expanded(
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         model.name!,
                         maxLines: 4,
                         style: TextStyle(

                           //fontSize: 14,
                         ),


                       ),
                       Spacer(),
                       Row(
                         children: [
                           Text(
                             model.price.toString(),
                             style: TextStyle(
                               fontSize: 14,
                               height: 1.3,
                             ),
                           ),
                           SizedBox(
                             width: 5,
                           ),
                           if (model.discount != 0)
                             Text(
                               model.oldPrice.toString(),
                               style: TextStyle(
                                 fontSize: 10,
                                 color: Colors.grey,
                                 decoration: TextDecoration.lineThrough,
                               ),
                             ),
                           Spacer(),
                           CircleAvatar(
                             radius: 15,
                             backgroundColor:
                             provider.favarites![model.id] == true
                                 ? Colors.red
                                 : Colors.grey,
                             child: IconButton(
                                 onPressed: () {
                                   //print(provider.favarites.toString());

                                   provider.ChangeFavorites(model.id!);
                                 },
                                 icon: Icon(
                                   Icons.favorite,
                                   size: 14,
                                   color: Colors.white,
                                 )),
                           )
                         ],
                       ),
                     ],
                   ),
                 ),
               )
             ],
           ),
         ),
       ),
     );
   },) ;
