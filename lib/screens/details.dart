import 'package:final_ecommerce/providers/product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Details extends StatelessWidget {
  const Details({super.key,required this.index});
  final index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Consumer<ProductProvider>(
          builder: (context, providerObj, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                  child: Image.network(providerObj.productModel?.products[index]['image'])
              ),
              SizedBox(height: 20,),
              Text(providerObj.productModel?.products[index]['name'],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10,),
              Text(providerObj.productModel?.products[index]['description'],
              style: TextStyle(
                fontSize: 10
              ),
                maxLines: 20,
              )

            ],
          ),
        ),
      ),
    );
  }
}
