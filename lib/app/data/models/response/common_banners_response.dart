// To parse this JSON data, do
//
//     final bannersResponse = bannersResponseFromJson(jsonString);

import 'dart:convert';

BannersResponse bannersResponseFromJson(String str) =>
    BannersResponse.fromJson(json.decode(str));

String bannersResponseToJson(BannersResponse data) =>
    json.encode(data.toJson());

class BannersResponse {
  Data? data;
  int? code;
  String? type;
  Message? message;
  bool? displayCodeError;
  bool? displayMessage;

  BannersResponse({
    this.data,
    this.code,
    this.type,
    this.message,
    this.displayCodeError,
    this.displayMessage,
  });

  factory BannersResponse.fromJson(Map<String, dynamic> json) =>
      BannersResponse(
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
  List<String>? files;

  Data({
    this.files,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        files: json["files"] == null
            ? []
            : List<String>.from(json["files"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "files": files == null ? [] : List<dynamic>.from(files!.map((x) => x)),
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
