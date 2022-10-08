import 'package:final_gsg_app_flutter/shop_app/data/dio_helper.dart';
import 'package:final_gsg_app_flutter/shop_app/provider/shop_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

class TestingScreen extends StatelessWidget {
  const TestingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ShopProvider>(builder: (context, provider, child) {
            return  Center(
              child: ElevatedButton(onPressed: (){
                DioHelper.dioHelper.getCart();

              }, child: Text('get cart')),
            );
          },

          )
          

          // TypeAheadField(
          //   textFieldConfiguration: TextFieldConfiguration(
          //       autofocus: true,
          //       style: DefaultTextStyle.of(context).style.copyWith(
          //           fontStyle: FontStyle.italic
          //       ),
          //       decoration: InputDecoration(
          //         labelText: 'search',
          //         prefixIcon:Icon(Icons.search) ,
          //           border: OutlineInputBorder()
          //       )
          //   ),
          //   suggestionsCallback: (pattern) async {
          //     return await BackendService.getSuggestions(pattern);
          //   },
          //   itemBuilder: (context, suggestion) {
          //     return ListTile(
          //       leading: Icon(Icons.search),
          //       title: Text(suggestion['name']),
          //       subtitle: Text('\$${suggestion['price']}'),
          //     );
          //   },
          //   onSuggestionSelected: (suggestion) {
          //     Navigator.of(context).push(MaterialPageRoute(
          //         builder: (context) => ProductPage(product: suggestion)
          //     ));
          //   },
          // )
        ],
      ),
    );
  }
}
