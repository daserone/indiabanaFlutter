// To parse this JSON data, do
//
//     final productsByCatResponse = productsByCatResponseFromJson(jsonString);

import 'dart:convert';

ProductsByCatResponse productsByCatResponseFromJson(String str) =>
    ProductsByCatResponse.fromJson(json.decode(str));

String productsByCatResponseToJson(ProductsByCatResponse data) =>
    json.encode(data.toJson());

class ProductsByCatResponse {
  Data? data;
  int? code;
  String? type;
  Message? message;
  bool? displayCodeError;
  bool? displayMessage;

  ProductsByCatResponse({
    this.data,
    this.code,
    this.type,
    this.message,
    this.displayCodeError,
    this.displayMessage,
  });

  factory ProductsByCatResponse.fromJson(Map<String, dynamic> json) =>
      ProductsByCatResponse(
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
  List<ProductElement>? products;

  Data({
    this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        products: json["products"] == null
            ? []
            : List<ProductElement>.from(
                json["products"]!.map((x) => ProductElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class ProductElement {
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
  List<String>? questions;
  String? id;
  int? price;
  int? offerPrice;
  Seller? seller;
  String? description;
  DateTime? saleStartime;
  DateTime? saleEndtime;
  int? quantity;
  ProductProduct? product;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ProductElement({
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

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
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
            : List<String>.from(json["questions"]!.map((x) => x)),
        id: json["_id"],
        price: json["price"],
        offerPrice: json["offer_price"],
        seller: json["seller"] == null ? null : Seller.fromJson(json["seller"]),
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
        "seller": seller?.toJson(),
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
  String? description;
  String? condition;
  String? warranty;
  int? warrantyTime;
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

class Seller {
  String? logoImg;
  String? bannerImg;
  List<dynamic>? stock;
  int? reputation;
  int? reputationCount;
  dynamic postalCode;
  dynamic phone;
  String? dni;
  List<dynamic>? alliances;
  List<dynamic>? alliancesRequestsSended;
  List<dynamic>? alliancesRequestsReceived;
  List<dynamic>? commentaries;
  List<dynamic>? buyerCommentaries;
  List<dynamic>? commitments;
  List<dynamic>? questionsFromBuyer;
  String? id;
  String? name;
  int? cuit;
  String? socialReason;
  String? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Seller({
    this.logoImg,
    this.bannerImg,
    this.stock,
    this.reputation,
    this.reputationCount,
    this.postalCode,
    this.phone,
    this.dni,
    this.alliances,
    this.alliancesRequestsSended,
    this.alliancesRequestsReceived,
    this.commentaries,
    this.buyerCommentaries,
    this.commitments,
    this.questionsFromBuyer,
    this.id,
    this.name,
    this.cuit,
    this.socialReason,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        logoImg: json["logoImg"],
        bannerImg: json["bannerImg"],
        stock: json["stock"] == null
            ? []
            : List<dynamic>.from(json["stock"]!.map((x) => x)),
        reputation: json["reputation"],
        reputationCount: json["reputationCount"],
        postalCode: json["postalCode"],
        phone: json["phone"],
        dni: json["DNI"],
        alliances: json["alliances"] == null
            ? []
            : List<dynamic>.from(json["alliances"]!.map((x) => x)),
        alliancesRequestsSended: json["alliances_requests_sended"] == null
            ? []
            : List<dynamic>.from(
                json["alliances_requests_sended"]!.map((x) => x)),
        alliancesRequestsReceived: json["alliances_requests_received"] == null
            ? []
            : List<dynamic>.from(
                json["alliances_requests_received"]!.map((x) => x)),
        commentaries: json["commentaries"] == null
            ? []
            : List<dynamic>.from(json["commentaries"]!.map((x) => x)),
        buyerCommentaries: json["buyer_commentaries"] == null
            ? []
            : List<dynamic>.from(json["buyer_commentaries"]!.map((x) => x)),
        commitments: json["commitments"] == null
            ? []
            : List<dynamic>.from(json["commitments"]!.map((x) => x)),
        questionsFromBuyer: json["questions_from_buyer"] == null
            ? []
            : List<dynamic>.from(json["questions_from_buyer"]!.map((x) => x)),
        id: json["_id"],
        name: json["name"],
        cuit: json["CUIT"],
        socialReason: json["socialReason"],
        user: json["user"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "logoImg": logoImg,
        "bannerImg": bannerImg,
        "stock": stock == null ? [] : List<dynamic>.from(stock!.map((x) => x)),
        "reputation": reputation,
        "reputationCount": reputationCount,
        "postalCode": postalCode,
        "phone": phone,
        "DNI": dni,
        "alliances": alliances == null
            ? []
            : List<dynamic>.from(alliances!.map((x) => x)),
        "alliances_requests_sended": alliancesRequestsSended == null
            ? []
            : List<dynamic>.from(alliancesRequestsSended!.map((x) => x)),
        "alliances_requests_received": alliancesRequestsReceived == null
            ? []
            : List<dynamic>.from(alliancesRequestsReceived!.map((x) => x)),
        "commentaries": commentaries == null
            ? []
            : List<dynamic>.from(commentaries!.map((x) => x)),
        "buyer_commentaries": buyerCommentaries == null
            ? []
            : List<dynamic>.from(buyerCommentaries!.map((x) => x)),
        "commitments": commitments == null
            ? []
            : List<dynamic>.from(commitments!.map((x) => x)),
        "questions_from_buyer": questionsFromBuyer == null
            ? []
            : List<dynamic>.from(questionsFromBuyer!.map((x) => x)),
        "_id": id,
        "name": name,
        "CUIT": cuit,
        "socialReason": socialReason,
        "user": user,
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
