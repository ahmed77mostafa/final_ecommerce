import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final image;
  final name;
  final price;

  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.price
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.blueAccent,
      child: Container(
        height: 250,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
                child: Image.network(image)),
            SizedBox(height: 4,),
            Text(name,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),maxLines: 1,),
            SizedBox(height: 4,),
            Text('$price LE',style:TextStyle(fontSize: 10,fontWeight: FontWeight.bold) ,)
          ],
        ),
      ),
    );
  }
}
