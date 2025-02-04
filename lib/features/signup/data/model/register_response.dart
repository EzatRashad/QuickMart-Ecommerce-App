
import 'user_model.dart';

class RegisterResponse {
  RegisterResponse(
      {this.message, this.user, this.token, this.error, this.statusMsg});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      statusMsg: json['statusMsg'],
      message: json['message'],
      error: json['errors'],
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'],
    );
  }

  String? message;
  UserModel? user;
  String? statusMsg;

  Error? error;
  String? token;
}
