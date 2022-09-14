import 'package:final_gsg_app_flutter/shop_app/data/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorite_model.dart';
import '../provider/shop_provider.dart';

class FavariteScreen extends StatelessWidget {
  const FavariteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: provider.changeFavoritesModel == null
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite_border,
                color: Colors.green,
                size: 80,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Your Favorites is empty',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Be Sure to file your favorites with something you like '),
            ],
          )
              : ListView.separated(
              itemBuilder: (context, index) => buildFavItem(
                  provider.favoritesModel!.data!.data![index].product!),
              separatorBuilder: (context, index) => Divider(
                height: 2,
                color: Colors.grey,
              ),
              itemCount: provider.favoritesModel!.data!.data!.length),
        );
      },
    );
  }
}

Widget buildFavItem(Product model) => Consumer<ShopProvider>(
  builder: (context, provider, child) {
    return Padding(
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
    );
  },
);
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
// child: provider.favoritesModel==null?CircularProgressIndicator(): ListView.separated(
// itemBuilder: (context, index) =>
// buildFavItem(provider.favoritesModel!.data!.data![index].product!),
// separatorBuilder: (context, index) => Divider(
// height: 2,
// color: Colors.grey,
// ),
// itemCount: provider.favoritesModel!.data!.data!.length),
// )

// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
// child: provider.getFav==null?CircularProgressIndicator(): ListView.separated(
// itemBuilder: (context, index) =>
// buildFavItem(provider.getFav![index].product!),
// separatorBuilder: (context, index) => Divider(
// height: 2,
// color: Colors.grey,
// ),
// itemCount: provider.getFav.length),
// );