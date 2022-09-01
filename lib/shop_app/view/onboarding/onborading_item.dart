import 'package:flutter/material.dart';

import 'boardingModel.dart';

class OnBoardingItem extends StatelessWidget {
  BoardingModel? model;

  OnBoardingItem(this.model);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            model!.image,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            model!.title,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 30,
          ),
          Text(model!.body),
        ],
      ),
    );
  }
}
