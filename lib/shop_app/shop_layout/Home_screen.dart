import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_gsg_app_flutter/shop_app/data/dio_helper.dart';
import 'package:final_gsg_app_flutter/shop_app/provider/shop_provider.dart';
import 'package:final_gsg_app_flutter/shop_app/provider/shop_provider.dart';
import 'package:final_gsg_app_flutter/shop_app/shop_layout/widget/carusal_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/home_model.dart';
import '../provider/shop_provider.dart';
import '../provider/shop_provider.dart';
import '../provider/shop_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              // CarusalSliderWidget(),
              buliderWidget(),
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
            return GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1 / 1.5,
              children: List.generate(
                provider.Products.length,
                (index) => buliderGridProduct(provider.Products[index]),
              ),
            );
          },
        ),
      ],
    );

Widget buliderGridProduct(ProductsModel model) => Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(alignment: AlignmentDirectional.bottomStart,
              children: [
            if(model.discount != 0)
            Container(
              color: Colors.red,
              child: Text(
                'Discount',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
            Image(
              image: NetworkImage(
                model.images!.toString(),
              ),
              height: 200,
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
              model.discount != 0
                  ? Text(
                      " ${model.oldPrice!.round()}",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    )
                  : Text(' '),
              Spacer(),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.favorite_border_outlined))
            ],
          ),
        ],
      ),
    );
