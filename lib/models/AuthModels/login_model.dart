class LoginModel {
  String? status;
  String? message;
  String? token;
  late UserData user;

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    user = (json['user'] != null ? UserData.fromJson(json['user']) : null)!;
  }
}

class UserData {
  int? id;
  String? password;
  String? email;
  String? name;
  String? token;
  String? message;
  String? status;

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    password = json['password'];
    email = json['email'];
    name = json['name'];
    token = json['token'];
    message = json['message'];
    status = json['status'];
  }
}
