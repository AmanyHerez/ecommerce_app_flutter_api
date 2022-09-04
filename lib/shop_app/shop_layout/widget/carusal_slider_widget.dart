// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:final_gsg_app_flutter/shop_app/models/home_model.dart';
// import 'package:flutter/material.dart';
//
// Widget CarusalSliderWidget(HomeModel model) {
//   return CarouselSlider(
//     options: CarouselOptions(
//       height: 250,
//       aspectRatio: 16 / 9,
//       viewportFraction: 0.8,
//       initialPage: 0,
//       enableInfiniteScroll: true,
//       reverse: false,
//       autoPlay: true,
//       autoPlayInterval: Duration(seconds: 3),
//       autoPlayAnimationDuration: Duration(milliseconds: 800),
//       autoPlayCurve: Curves.fastOutSlowIn,
//       enlargeCenterPage: true,
//       scrollDirection: Axis.horizontal,
//     ),
//     items: model!.data!.banners!
//         .map(
//           (e) => Image(
//             image: NetworkImage(
//               "${e.image!}",
//             ),
//             width: double.infinity,
//           ),
//         )
//         .toList(),
//   );
// }
