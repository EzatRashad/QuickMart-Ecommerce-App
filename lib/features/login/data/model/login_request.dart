class LoginRequest {
  LoginRequest({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }
}
