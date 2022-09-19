import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_gsg_app_flutter/shop_app/data/dio_helper.dart';
import 'package:final_gsg_app_flutter/shop_app/models/categories_model.dart';
import 'package:final_gsg_app_flutter/shop_app/provider/shop_provider.dart';
import 'package:final_gsg_app_flutter/shop_app/provider/shop_provider.dart';
import 'package:final_gsg_app_flutter/shop_app/router/router.dart';
import 'package:final_gsg_app_flutter/shop_app/shop_layout/widget/carusal_slider_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/home_model.dart';
import '../provider/shop_provider.dart';
import '../provider/shop_provider.dart';
import '../provider/shop_provider.dart';
import 'details_product_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              CarusalSliderWidget(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Categories',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  height: 120,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildCategoryItem(provider.Categories[index]),
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      itemCount: provider.Categories.length),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'New Products',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              buliderWidget()
            ],
          ),
        );
      },
    );
  }
}

Widget buliderWidget() => Column(
  children: [
    Consumer<ShopProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 10,
            childAspectRatio: 1 / 1.75,
            children: List.generate(
              provider.Products.length,
                  (index) => InkWell(
                  onTap: (){
                    provider.ProductDetails(provider.Products[index].id!);
                    AppRouter.NavigateToWidget(ProductDetailsScreen());
                  },
                  child: buliderGridProduct(provider.Products[index])),
            ),
          ),
        );
      },
    ),
  ],
);

Widget buliderGridProduct(ProductsModel model) => Consumer<ShopProvider>(
  builder: (context, provider, child) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image.network(
                  model.image!,
                  width: double.infinity,
                  height: 210,
                  //fit: BoxFit.cover,
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

          Text(
            model.name!,
            style: TextStyle(
              fontSize: 14,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Spacer(),
          Row(
            children: [
              Text(
                model.price!.toString(),
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
                  " ${model.oldPrice!.round()}",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.shade700,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              Spacer(),
              CircleAvatar(
                radius: 15,
                backgroundColor: provider.favarites![model.id!]==true?Colors.red.shade400:Colors.grey,
                child: IconButton(
                    onPressed: () {
                      //print(provider.favarites.toString());
                      provider.ChangeFavorites(model.id!);
                    }, icon: Icon(Icons.favorite_border,size: 14,color: Colors.white,)),
              )
            ],
          ),
        ],
      ),
    );
  },

);

Widget buildCategoryItem(DataModel model) => Stack(
  alignment: AlignmentDirectional.bottomCenter,
  children: [
    Image(
      image: NetworkImage(model.image!),
      width: 100,
      height: 120,
      fit: BoxFit.cover,
    ),
    Container(
      color: Colors.black87.withOpacity(.8),
      width: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          model.name!,
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    )
  ],
);