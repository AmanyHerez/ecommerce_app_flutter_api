import 'package:final_gsg_app_flutter/shop_app/data/dio_helper.dart';
import 'package:flutter/material.dart';

class FavariteScreen extends StatelessWidget {
const FavariteScreen ({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
return Container(
  child: Column(
    children: [
      ElevatedButton(
        onPressed: (){
          DioHelper.dioHelper.ChangeFavorites(53);
        },
        child: Text('favarite'),
      ),
      ElevatedButton(
        onPressed: (){
          //DioHelper.dioHelper.Register();
        },
        child: Text('register'),
      ),
    ],
  ),
);
}
}
