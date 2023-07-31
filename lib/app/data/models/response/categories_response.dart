// To parse this JSON data, do
//
//     final categoriesResponse = categoriesResponseFromJson(jsonString);

import 'dart:convert';

CategoriesResponse categoriesResponseFromJson(String str) =>
    CategoriesResponse.fromJson(json.decode(str));

String categoriesResponseToJson(CategoriesResponse data) =>
    json.encode(data.toJson());

class CategoriesResponse {
  Data? data;
  int? code;
  String? type;
  Message? message;
  bool? displayCodeError;
  bool? displayMessage;

  CategoriesResponse({
    this.data,
    this.code,
    this.type,
    this.message,
    this.displayCodeError,
    this.displayMessage,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      CategoriesResponse(
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
  List<Category>? categories;

  Data({
    this.categories,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class Category {
  List<SubCategories>? subCategories1;
  List<SubCategories>? subCategories2;
  List<String>? products;
  List<dynamic>? combos;
  String? id;
  String? name;
  String? bannerImg;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Category({
    this.subCategories1,
    this.subCategories2,
    this.products,
    this.combos,
    this.id,
    this.name,
    this.bannerImg,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        subCategories1: json["subCategories1"] == null
            ? []
            : List<SubCategories>.from(
                json["subCategories1"]!.map((x) => SubCategories.fromJson(x))),
        subCategories2: json["subCategories2"] == null
            ? []
            : List<SubCategories>.from(
                json["subCategories2"]!.map((x) => SubCategories.fromJson(x))),
        products: json["products"] == null
            ? []
            : List<String>.from(json["products"]!.map((x) => x)),
        combos: json["combos"] == null
            ? []
            : List<dynamic>.from(json["combos"]!.map((x) => x)),
        id: json["_id"],
        name: json["name"],
        bannerImg: json["bannerImg"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "subCategories1": subCategories1 == null
            ? []
            : List<dynamic>.from(subCategories1!.map((x) => x.toJson())),
        "subCategories2": subCategories2 == null
            ? []
            : List<dynamic>.from(subCategories2!.map((x) => x.toJson())),
        "products":
            products == null ? [] : List<dynamic>.from(products!.map((x) => x)),
        "combos":
            combos == null ? [] : List<dynamic>.from(combos!.map((x) => x)),
        "_id": id,
        "name": name,
        "bannerImg": bannerImg,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class SubCategories {
  List<dynamic>? products;
  List<dynamic>? combos;
  String? id;
  String? name;
  String? category;
  int? v;
  DateTime? createdAt;
  DateTime? updatedAt;

  SubCategories({
    this.products,
    this.combos,
    this.id,
    this.name,
    this.category,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  factory SubCategories.fromJson(Map<String, dynamic> json) => SubCategories(
        products: json["products"] == null
            ? []
            : List<dynamic>.from(json["products"]!.map((x) => x)),
        combos: json["combos"] == null
            ? []
            : List<dynamic>.from(json["combos"]!.map((x) => x)),
        id: json["_id"],
        name: json["name"],
        category: json["category"],
        v: json["__v"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "products":
            products == null ? [] : List<dynamic>.from(products!.map((x) => x)),
        "combos":
            combos == null ? [] : List<dynamic>.from(combos!.map((x) => x)),
        "_id": id,
        "name": name,
        "category": category,
        "__v": v,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
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
