import 'package:dio/dio.dart';

import '../models/user_model.dart';

class UserService{
  static Dio dio = Dio();

  static Login({required email,required password}) async{
    try{
      Response response = await dio.post('https://student.valuxapps.com/api/login',
      data: {
        'email':email,
        'password':password
      });
      return UserModel.fromJson(response.data);
    }catch(e){
      throw Exception('Exception: $e');
    }
  }

  static SignUp({required name,required phone,required email,required password}) async{
    try{
      Response response = await dio.post('https://student.valuxapps.com/api/register',
      data: {
        'name':name,
        'phone':phone,
        'email':email,
        'password':password
      });
      return UserModel.fromJson(response.data);
    }catch(e){
      throw Exception('Exception: $e');
    }
  }
}