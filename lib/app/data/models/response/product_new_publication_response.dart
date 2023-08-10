// To parse this JSON data, do
//
//     final newPublicationResponse = newPublicationResponseFromJson(jsonString);

import 'dart:convert';

NewPublicationResponse newPublicationResponseFromJson(String str) =>
    NewPublicationResponse.fromJson(json.decode(str));

String newPublicationResponseToJson(NewPublicationResponse data) =>
    json.encode(data.toJson());

class NewPublicationResponse {
  Data? data;
  int? code;
  String? type;
  Message? message;
  bool? displayCodeError;
  bool? displayMessage;

  NewPublicationResponse({
    this.data,
    this.code,
    this.type,
    this.message,
    this.displayCodeError,
    this.displayMessage,
  });

  factory NewPublicationResponse.fromJson(Map<String, dynamic> json) =>
      NewPublicationResponse(
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
  Publishment? publishment;

  Data({
    this.publishment,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        publishment: json["publishment"] == null
            ? null
            : Publishment.fromJson(json["publishment"]),
      );

  Map<String, dynamic> toJson() => {
        "publishment": publishment?.toJson(),
      };
}

class Publishment {
  List<dynamic>? images;
  DateTime? validUntil;
  int? exposition;
  bool? isActive;
  String? id;
  int? plan;
  String? stock;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Publishment({
    this.images,
    this.validUntil,
    this.exposition,
    this.isActive,
    this.id,
    this.plan,
    this.stock,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Publishment.fromJson(Map<String, dynamic> json) => Publishment(
        images: json["images"] == null
            ? []
            : List<dynamic>.from(json["images"]!.map((x) => x)),
        validUntil: json["validUntil"] == null
            ? null
            : DateTime.parse(json["validUntil"]),
        exposition: json["exposition"],
        isActive: json["isActive"],
        id: json["_id"],
        plan: json["plan"],
        stock: json["stock"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "validUntil": validUntil?.toIso8601String(),
        "exposition": exposition,
        "isActive": isActive,
        "_id": id,
        "plan": plan,
        "stock": stock,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
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
