import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_gsg_app_flutter/shop_app/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

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
          (e) =>Container(
            margin: const EdgeInsets.all(10),
            child: ClipRRect(
                borderRadius:
                const BorderRadius.all(Radius.circular(10.0)),
                child: Stack(
                  children: <Widget>[
                    CachedNetworkImage(
                      imageUrl: e.image!.toString(),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                          Shimmer.fromColors(
                            highlightColor: Colors.white,
                            baseColor: Colors.grey.shade300,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                child: AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: Container(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ],
                )),
          )
        ).toList(),
      );
    },
  );
}
// Image(
// image: NetworkImage(
// "${e.image!}",
// ),
// width: double.infinity,
// fit: BoxFit.cover,
// ),