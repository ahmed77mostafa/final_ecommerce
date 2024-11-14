import 'package:dio/dio.dart';

import '../models/product_model.dart';

class ProductService{
  static Dio dio = Dio();

  static Future<ProductModel> getService() async{
    try{
      Response response = await dio.get('https://student.valuxapps.com/api/home');
      if(response.statusCode == 200){
        return ProductModel.fromJson(response.data);
      }else{
        throw Exception('Failed to load data..........');
      }
    }catch(e){
      throw Exception('Exception: $e');
    }
  }
}