import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../screens/products.dart';
import '../services/user_service.dart';

class UserProvider extends ChangeNotifier{
  bool? status;

  Login({required email,required password}) async{
    UserModel userModel = await UserService.Login(email: email, password: password);
    status = userModel.status;
    notifyListeners();
  }

  SignUp({required name,required phone,required email,required password}) async{
    await UserService.SignUp(name: name, phone: phone, email: email, password: password);
    notifyListeners();
  }
}