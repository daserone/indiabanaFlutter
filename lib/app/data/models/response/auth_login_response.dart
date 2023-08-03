// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  Data? data;
  int? code;
  String? type;
  Message? message;
  bool? displayCodeError;
  bool? displayMessage;

  LoginResponse({
    this.data,
    this.code,
    this.type,
    this.message,
    this.displayCodeError,
    this.displayMessage,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        code: json["code"],
        type: json["type"],
        message:
            json["message"] == null ? null : Message.fromJson(json["message"]),
        displayCodeError: json["displayCodeError"],
        displayMessage: json["displayMessage"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "code": code,
        "type": type,
        "message": message?.toJson(),
        "displayCodeError": displayCodeError,
        "displayMessage": displayMessage,
      };
}

class Data {
  String? token;

  Data({
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

class Message {
  String? original;
  String? translation;

  Message({
    this.original,
    this.translation,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        original: json["original"],
        translation: json["translation"],
      );

  Map<String, dynamic> toJson() => {
        "original": original,
        "translation": translation,
      };
}
