// To parse this JSON data, do
//
//     final variantModel = variantModelFromJson(jsonString);

import 'dart:convert';

import 'package:image_picker/image_picker.dart';

VariantModel variantModelFromJson(String str) =>
    VariantModel.fromJson(json.decode(str));

String variantModelToJson(VariantModel data) => json.encode(data.toJson());

class VariantModel {
  String? stock;
  String? name;
  String? value;
  String? price;
  String? quantity;
  bool? onSale;
  int? mainImageIndex;
  XFile? images;

  String? saleStart;
  String? saleEnd;
  String? offerPrice;

  VariantModel({
    this.stock,
    this.name,
    this.value,
    this.price,
    this.quantity,
    this.onSale,
    this.mainImageIndex,
    this.images,
    this.saleStart,
    this.saleEnd,
    this.offerPrice,
  });

  factory VariantModel.fromJson(Map<String, dynamic> json) => VariantModel(
        stock: json["stock"],
        name: json["name"],
        value: json["value"],
        price: json["price"],
        quantity: json["quantity"],
        onSale: json["on_sale"],
        mainImageIndex: json["main_image_index"],
        images: json["images"],
      );

  Map<String, dynamic> toJson() => {
        "stock": stock,
        "name": name,
        "value": value,
        "price": price,
        "quantity": quantity,
        "on_sale": onSale,
        "main_image_index": mainImageIndex,
        "images": images,
        'sale_startime': saleStart,
        'sale_endtime': saleEnd,
        'offer_price': offerPrice,
      };
}
