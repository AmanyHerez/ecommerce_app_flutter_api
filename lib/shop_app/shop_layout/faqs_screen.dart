import 'package:final_gsg_app_flutter/shop_app/provider/shop_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/faq_model.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProvider>(
      builder: (context, value, child) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
              title: Text(
                "FQA",
                style: TextStyle(color: Colors.black,fontSize: 30),
              ),
            ),
            body: Consumer<ShopProvider>(
              builder: (context, provider, child) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: provider.faQsModel == null
                      ? Center(child: CircularProgressIndicator())
                      : ListView.separated(
                          itemCount: provider.faQsModel!.data!.data!.length,
                          //provider.faQsModel!.data!.data!.length
                          itemBuilder: ((context, index) {
                            return fqaBuilder(
                                provider.faQsModel!.data!.data![index]);
                          }),
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              height: 4,
                              thickness: 1,
                            );
                          },
                        ),
                );
              },
            ));
      },
    );
  }
}

Widget fqaBuilder(FAQsData model) => Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Text(
            model.question!,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            model.answer!,
            style: TextStyle(
              height: 1.4,
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
