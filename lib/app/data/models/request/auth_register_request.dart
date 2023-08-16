// To parse this JSON data, do
//
//     final registerRequest = registerRequestFromJson(jsonString);

import 'dart:convert';

RegisterRequest registerRequestFromJson(String str) =>
    RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) =>
    json.encode(data.toJson());

class RegisterRequest {
  String? name;
  String? password;
  String? email;

  RegisterRequest({
    this.name,
    this.password,
    this.email,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        name: json["name"],
        password: json["password"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
        "email": email,
      };
}
