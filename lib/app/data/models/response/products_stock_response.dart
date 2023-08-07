// To parse this JSON data, do
//
//     final productByIdResponse = productByIdResponseFromJson(jsonString);

import 'dart:convert';

ProductByIdResponse productByIdResponseFromJson(String str) =>
    ProductByIdResponse.fromJson(json.decode(str));

String productByIdResponseToJson(ProductByIdResponse data) =>
    json.encode(data.toJson());

class ProductByIdResponse {
  Data? data;
  int? code;
  String? type;
  Message? message;
  bool? displayCodeError;
  bool? displayMessage;

  ProductByIdResponse({
    this.data,
    this.code,
    this.type,
    this.message,
    this.displayCodeError,
    this.displayMessage,
  });

  factory ProductByIdResponse.fromJson(Map<String, dynamic> json) =>
      ProductByIdResponse(
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
  DataProduct? product;

  Data({
    this.product,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        product: json["product"] == null
            ? null
            : DataProduct.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "product": product?.toJson(),
      };
}

class DataProduct {
  bool? onSale;
  List<dynamic>? variations;
  List<dynamic>? shippingMethod;
  String? status;
  String? mainImage;
  dynamic sku;
  List<String>? images;
  int? score;
  int? scoreCount;
  List<dynamic>? shippingCompanyData;
  bool? isActive;
  int? sellsQty;
  int? views;
  List<dynamic>? questions;
  String? id;
  int? price;
  int? offerPrice;
  String? seller;
  String? description;
  DateTime? saleStartime;
  DateTime? saleEndtime;
  int? quantity;
  ProductProduct? product;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  DataProduct({
    this.onSale,
    this.variations,
    this.shippingMethod,
    this.status,
    this.mainImage,
    this.sku,
    this.images,
    this.score,
    this.scoreCount,
    this.shippingCompanyData,
    this.isActive,
    this.sellsQty,
    this.views,
    this.questions,
    this.id,
    this.price,
    this.offerPrice,
    this.seller,
    this.description,
    this.saleStartime,
    this.saleEndtime,
    this.quantity,
    this.product,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory DataProduct.fromJson(Map<String, dynamic> json) => DataProduct(
        onSale: json["onSale"],
        variations: json["variations"] == null
            ? []
            : List<dynamic>.from(json["variations"]!.map((x) => x)),
        shippingMethod: json["shippingMethod"] == null
            ? []
            : List<dynamic>.from(json["shippingMethod"]!.map((x) => x)),
        status: json["status"],
        mainImage: json["main_image"],
        sku: json["sku"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        score: json["score"],
        scoreCount: json["scoreCount"],
        shippingCompanyData: json["shipping_company_data"] == null
            ? []
            : List<dynamic>.from(json["shipping_company_data"]!.map((x) => x)),
        isActive: json["isActive"],
        sellsQty: json["sells_qty"],
        views: json["views"],
        questions: json["questions"] == null
            ? []
            : List<dynamic>.from(json["questions"]!.map((x) => x)),
        id: json["_id"],
        price: json["price"],
        offerPrice: json["offer_price"],
        seller: json["seller"],
        description: json["description"],
        saleStartime: json["sale_startime"] == null
            ? null
            : DateTime.parse(json["sale_startime"]),
        saleEndtime: json["sale_endtime"] == null
            ? null
            : DateTime.parse(json["sale_endtime"]),
        quantity: json["quantity"],
        product: json["product"] == null
            ? null
            : ProductProduct.fromJson(json["product"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "onSale": onSale,
        "variations": variations == null
            ? []
            : List<dynamic>.from(variations!.map((x) => x)),
        "shippingMethod": shippingMethod == null
            ? []
            : List<dynamic>.from(shippingMethod!.map((x) => x)),
        "status": status,
        "main_image": mainImage,
        "sku": sku,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "score": score,
        "scoreCount": scoreCount,
        "shipping_company_data": shippingCompanyData == null
            ? []
            : List<dynamic>.from(shippingCompanyData!.map((x) => x)),
        "isActive": isActive,
        "sells_qty": sellsQty,
        "views": views,
        "questions": questions == null
            ? []
            : List<dynamic>.from(questions!.map((x) => x)),
        "_id": id,
        "price": price,
        "offer_price": offerPrice,
        "seller": seller,
        "description": description,
        "sale_startime": saleStartime?.toIso8601String(),
        "sale_endtime": saleEndtime?.toIso8601String(),
        "quantity": quantity,
        "product": product?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class ProductProduct {
  String? brand;
  int? offerPrice;
  bool? onSale;
  String? model;
  String? code;
  int? weight;
  int? height;
  int? width;
  int? length;
  List<String>? shippingMethod;
  String? mainImage;
  String? sku;
  List<String>? images;
  int? score;
  int? scoreCount;
  List<dynamic>? shippingCompanyData;
  bool? isActive;
  int? sellsQty;
  int? views;
  List<dynamic>? variations;
  String? id;
  String? name;
  String? description;
  String? condition;
  String? warranty;
  dynamic warrantyTime;
  String? datasheet;
  int? price;
  DateTime? saleStartime;
  DateTime? saleEndtime;
  int? stock;
  String? warrantyTimeType;
  String? shippingCostMethod;
  String? category;
  String? seller;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ProductProduct({
    this.brand,
    this.offerPrice,
    this.onSale,
    this.model,
    this.code,
    this.weight,
    this.height,
    this.width,
    this.length,
    this.shippingMethod,
    this.mainImage,
    this.sku,
    this.images,
    this.score,
    this.scoreCount,
    this.shippingCompanyData,
    this.isActive,
    this.sellsQty,
    this.views,
    this.variations,
    this.id,
    this.name,
    this.description,
    this.condition,
    this.warranty,
    this.warrantyTime,
    this.datasheet,
    this.price,
    this.saleStartime,
    this.saleEndtime,
    this.stock,
    this.warrantyTimeType,
    this.shippingCostMethod,
    this.category,
    this.seller,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
        brand: json["brand"],
        offerPrice: json["offer_price"],
        onSale: json["onSale"],
        model: json["model"],
        code: json["code"],
        weight: json["weight"],
        height: json["height"],
        width: json["width"],
        length: json["length"],
        shippingMethod: json["shippingMethod"] == null
            ? []
            : List<String>.from(json["shippingMethod"]!.map((x) => x)),
        mainImage: json["main_image"],
        sku: json["sku"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        score: json["score"],
        scoreCount: json["scoreCount"],
        shippingCompanyData: json["shipping_company_data"] == null
            ? []
            : List<dynamic>.from(json["shipping_company_data"]!.map((x) => x)),
        isActive: json["isActive"],
        sellsQty: json["sells_qty"],
        views: json["views"],
        variations: json["variations"] == null
            ? []
            : List<dynamic>.from(json["variations"]!.map((x) => x)),
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        condition: json["condition"],
        warranty: json["warranty"],
        warrantyTime: json["warranty_time"],
        datasheet: json["datasheet"],
        price: json["price"],
        saleStartime: json["sale_startime"] == null
            ? null
            : DateTime.parse(json["sale_startime"]),
        saleEndtime: json["sale_endtime"] == null
            ? null
            : DateTime.parse(json["sale_endtime"]),
        stock: json["stock"],
        warrantyTimeType: json["warranty_timeType"],
        shippingCostMethod: json["shippingCost_method"],
        category: json["category"],
        seller: json["seller"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "brand": brand,
        "offer_price": offerPrice,
        "onSale": onSale,
        "model": model,
        "code": code,
        "weight": weight,
        "height": height,
        "width": width,
        "length": length,
        "shippingMethod": shippingMethod == null
            ? []
            : List<dynamic>.from(shippingMethod!.map((x) => x)),
        "main_image": mainImage,
        "sku": sku,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "score": score,
        "scoreCount": scoreCount,
        "shipping_company_data": shippingCompanyData == null
            ? []
            : List<dynamic>.from(shippingCompanyData!.map((x) => x)),
        "isActive": isActive,
        "sells_qty": sellsQty,
        "views": views,
        "variations": variations == null
            ? []
            : List<dynamic>.from(variations!.map((x) => x)),
        "_id": id,
        "name": name,
        "description": description,
        "condition": condition,
        "warranty": warranty,
        "warranty_time": warrantyTime,
        "datasheet": datasheet,
        "price": price,
        "sale_startime": saleStartime?.toIso8601String(),
        "sale_endtime": saleEndtime?.toIso8601String(),
        "stock": stock,
        "warranty_timeType": warrantyTimeType,
        "shippingCost_method": shippingCostMethod,
        "category": category,
        "seller": seller,
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
