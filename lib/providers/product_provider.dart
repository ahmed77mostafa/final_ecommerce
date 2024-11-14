import 'package:flutter/cupertino.dart';

import '../models/product_model.dart';
import '../services/product_service.dart';

class ProductProvider extends ChangeNotifier{
  ProductModel? productModel;

  getService() async{
    productModel = await ProductService.getService();
    notifyListeners();
  }
}