import 'package:final_gsg_app_flutter/shop_app/view/onboarding/boardingModel.dart';
import 'package:final_gsg_app_flutter/shop_app/view/onboarding/onborading_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../auth_screen/login_screen.dart';

class OnBordaingScreen extends StatefulWidget {
  @override
  State<OnBordaingScreen> createState() => _OnBordaingScreenState();
}

class _OnBordaingScreenState extends State<OnBordaingScreen> {
late  PageController pageController=PageController();
bool isLast=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                  onPageChanged: (int index){
                  if(index==boarding!.length-1 ){
                    setState(() {
                      isLast=true;
                    });
                   // print("last");
                  }
                  else{
                    setState(() {
                      isLast=false;
                    });
                  }
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: boarding!.length ,
                  itemBuilder: (context, index) {
                    return OnBoardingItem(boarding![index]);
                  }),
            ),
    Row(children: [
        SmoothPageIndicator(
          controller: pageController,
          count:  boarding!.length,
effect: ExpandingDotsEffect(
  dotColor: Colors.grey,
  activeDotColor: Colors.black87,
  dotHeight: 10,
  expansionFactor: 3,
  dotWidth: 10,
  spacing: 5
),

        ),
        Spacer(),
        FloatingActionButton(
          onPressed: () {
            if(isLast){
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return LoginScreen();
              }));
            }else{
              pageController.nextPage(duration: Duration(milliseconds: 3), curve: Curves.easeIn);
            }

          },
          backgroundColor: Colors.black87,
          child: Image.asset('asset/image/arrow.png'),
        ),
    ],),

          ],
        ),
      ),
    );
  }
}
