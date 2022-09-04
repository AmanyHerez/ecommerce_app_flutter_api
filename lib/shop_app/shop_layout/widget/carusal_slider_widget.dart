import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_gsg_app_flutter/shop_app/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/shop_provider.dart';

Widget CarusalSliderWidget() {
  return Consumer<ShopProvider>(
    builder: (context, provider, child) {
      return CarouselSlider(
        options: CarouselOptions(
          height: 250,
          //aspectRatio: 16 / 9,
          viewportFraction: 1.0,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        items: provider.Banners.map(
          (e) => Image(
            image: NetworkImage(
              "${e.image!}",
            ),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ).toList(),
      );
    },
  );
}
