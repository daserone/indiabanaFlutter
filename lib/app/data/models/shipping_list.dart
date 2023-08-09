// To parse this JSON data, do
//
//     final shipping = shippingFromJson(jsonString);

import 'dart:convert';

List<Shipping> shippingFromJson(String str) =>
    List<Shipping>.from(json.decode(str).map((x) => Shipping.fromJson(x)));

String shippingToJson(List<Shipping> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Shipping {
  String? company;
  String? price;

  Shipping({
    this.company,
    this.price,
  });

  factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
        company: json["company"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "company": company,
        "price": price,
      };
}
