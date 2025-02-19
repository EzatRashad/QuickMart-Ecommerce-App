
 
import '../../../signup/data/model/user_model.dart';

class LoginResponse {
  LoginResponse(
      {this.message, this.user, this.token,   this.statusMsg});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      statusMsg: json['statusMsg'],
      message: json['message'],
       user:  UserModel.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'],
    );
  }

  String? message;

  String? statusMsg;
  UserModel? user;
  String? token;
}
