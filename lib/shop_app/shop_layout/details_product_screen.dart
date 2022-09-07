import 'package:final_gsg_app_flutter/shop_app/provider/shop_provider.dart';
import 'package:final_gsg_app_flutter/shop_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatelessWidget {
  PageController productImages = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProvider>(
      builder: (context, provider, child) {
        return SafeArea(
          child: Scaffold(
            //
            // appBar: AppBar(
            //   elevation: 0,
            //     backgroundColor: Colors.transparent,
            //
            // ),
            body: provider.selectedProduct == null
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 400,
                          child: Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                PageView.builder(
                                  controller: productImages,
                                  itemBuilder: (context, index) => Image(
                                    image: NetworkImage(
                                        '${provider.selectedProduct!.data!.images![index]}'),
                                    width: double.infinity,
                                  ),
                                  itemCount: provider
                                      .selectedProduct!.data!.images!.length,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, top: 25),
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: provider.favarites![
                                                provider.selectedProduct!.data!
                                                    .id!] ==
                                            true
                                        ? Colors.red.shade400
                                        : Colors.grey,
                                    child: IconButton(
                                        onPressed: () {
                                          //print(provider.favarites.toString());
                                          provider.ChangeFavorites(provider
                                              .selectedProduct!.data!.id!);
                                        },
                                        icon: Icon(
                                          Icons.favorite,
                                          size: 20,
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 25),
                                    child: FloatingActionButton.small(
                                      onPressed: () {
                                        AppRouter.popRoute();
                                      },
                                      child:
                                          Icon(Icons.arrow_back_ios_outlined),
                                      backgroundColor: Colors.grey.shade400,
                                      //mini: true,
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SmoothPageIndicator(
                          controller: productImages,
                          count: provider.selectedProduct!.data!.images!.length,
                          effect: ExpandingDotsEffect(
                              dotColor: Colors.grey,
                              activeDotColor: Colors.black87,
                              expansionFactor: 3,
                              dotHeight: 7,
                              dotWidth: 7,
                              spacing: 7),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                provider.selectedProduct!.data!.name!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'price :',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    provider.selectedProduct!.data!.price
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  if (provider
                                          .selectedProduct!.data!.discount !=
                                      0)
                                    Text(
                                      provider.selectedProduct!.data!.discount
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                          decorationThickness: 2.5,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: Colors.red),
                                    ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Description:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ReadMoreText(
                                provider.selectedProduct!.data!.description!,
                                colorClickableText: Colors.pink,
                                trimLines: 8,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Show more',
                                trimExpandedText: 'Show less',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                lessStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                                moreStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
