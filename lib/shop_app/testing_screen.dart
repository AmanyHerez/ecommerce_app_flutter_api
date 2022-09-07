import 'package:final_gsg_app_flutter/shop_app/data/dio_helper.dart';
import 'package:flutter/material.dart';
class TestingScreen extends StatelessWidget {
  const TestingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
           // DioHelper.dioHelper.ProductDetails();
          }, child: Text('details product'))
        ],
      ),
    );
  }
}
