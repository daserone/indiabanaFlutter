// To parse this JSON data, do
//
//     final getAllProductsResponse = getAllProductsResponseFromJson(jsonString);

import 'dart:convert';

GetAllProductsResponse getAllProductsResponseFromJson(String str) =>
    GetAllProductsResponse.fromJson(json.decode(str));

String getAllProductsResponseToJson(GetAllProductsResponse data) =>
    json.encode(data.toJson());

class GetAllProductsResponse {
  Data? data;
  int? code;
  String? type;
  Message? message;
  bool? displayCodeError;
  bool? displayMessage;

  GetAllProductsResponse({
    this.data,
    this.code,
    this.type,
    this.message,
    this.displayCodeError,
    this.displayMessage,
  });

  factory GetAllProductsResponse.fromJson(Map<String, dynamic> json) =>
      GetAllProductsResponse(
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
  List<Doc>? docs;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  int? nextPage;

  Data({
    this.docs,
    this.totalDocs,
    this.limit,
    this.totalPages,
    this.page,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        docs: json["docs"] == null
            ? []
            : List<Doc>.from(json["docs"]!.map((x) => Doc.fromJson(x))),
        totalDocs: json["totalDocs"],
        limit: json["limit"],
        totalPages: json["totalPages"],
        page: json["page"],
        pagingCounter: json["pagingCounter"],
        hasPrevPage: json["hasPrevPage"],
        hasNextPage: json["hasNextPage"],
        prevPage: json["prevPage"],
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "docs": docs == null
            ? []
            : List<dynamic>.from(docs!.map((x) => x.toJson())),
        "totalDocs": totalDocs,
        "limit": limit,
        "totalPages": totalPages,
        "page": page,
        "pagingCounter": pagingCounter,
        "hasPrevPage": hasPrevPage,
        "hasNextPage": hasNextPage,
        "prevPage": prevPage,
        "nextPage": nextPage,
      };
}

class Doc {
  String? brand;
  int? offerPrice;
  bool? onSale;
  String? model;
  String? code;
  double? weight;
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
  int? price;
  int? stock;
  String? description;
  String? condition;
  String? datasheet;
  String? warranty;
  int? warrantyTime;
  DateTime? saleStartime;
  DateTime? saleEndtime;
  String? warrantyTimeType;
  String? shippingCostMethod;
  String? category;
  String? seller;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Doc({
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
    this.price,
    this.stock,
    this.description,
    this.condition,
    this.datasheet,
    this.warranty,
    this.warrantyTime,
    this.saleStartime,
    this.saleEndtime,
    this.warrantyTimeType,
    this.shippingCostMethod,
    this.category,
    this.seller,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        brand: json["brand"],
        offerPrice: json["offer_price"],
        onSale: json["onSale"],
        model: json["model"],
        code: json["code"],
        weight: json["weight"]?.toDouble(),
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
        price: json["price"],
        stock: json["stock"],
        description: json["description"],
        condition: json["condition"],
        datasheet: json["datasheet"],
        warranty: json["warranty"],
        warrantyTime: json["warranty_time"],
        saleStartime: json["sale_startime"] == null
            ? null
            : DateTime.parse(json["sale_startime"]),
        saleEndtime: json["sale_endtime"] == null
            ? null
            : DateTime.parse(json["sale_endtime"]),
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
        "price": price,
        "stock": stock,
        "description": description,
        "condition": condition,
        "datasheet": datasheet,
        "warranty": warranty,
        "warranty_time": warrantyTime,
        "sale_startime": saleStartime?.toIso8601String(),
        "sale_endtime": saleEndtime?.toIso8601String(),
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
