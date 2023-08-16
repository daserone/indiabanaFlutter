// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) =>
    RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) =>
    json.encode(data.toJson());

class RegisterResponse {
  Data? data;
  int? code;
  String? type;
  Message? message;
  bool? displayCodeError;
  bool? displayMessage;

  RegisterResponse({
    this.data,
    this.code,
    this.type,
    this.message,
    this.displayCodeError,
    this.displayMessage,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
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
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data();

  Map<String, dynamic> toJson() => {};
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
