class Error {
  String value;
  String msg;
  String param;
  String location;

  Error(
      {required this.value,
      required this.msg,
      required this.param,
      required this.location});

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(
      value: json['value'],
      msg: json['msg'],
      param: json['param'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'msg': msg,
      'param': param,
      'location': location,
    };
  }
}
