import 'package:final_ecommerce/screens/details.dart';
import 'package:final_ecommerce/widgets/custom_product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Products',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
          centerTitle: true,
        ),
        body: Consumer<ProductProvider>(
          builder: (context, providerObj, child) {
            if (providerObj.productModel == null) {
              providerObj.getService();
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    mainAxisSpacing: 30
                  ),
                  itemCount: providerObj.productModel?.products.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => Details(index: index),)),
                      child: ProductCard(image: providerObj.productModel
                          ?.products[index]['image'],
                          name: providerObj.productModel?.products[index]['name'],
                          price: "${providerObj.productModel
                              ?.products[index]['price']
                      }"),
                    );
                  },);
            }
          },)
    );
  }
}
