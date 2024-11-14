class UserModel{
  bool status;

  UserModel({required this.status});

  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(status: json['status']);
  }
}