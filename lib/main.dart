import 'package:final_ecommerce/providers/product_provider.dart';
import 'package:final_ecommerce/providers/user_provider.dart';
import 'package:final_ecommerce/screens/login.dart';
import 'package:final_ecommerce/screens/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider(),),
        ChangeNotifierProvider(create: (context) => UserProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    );
  }
}