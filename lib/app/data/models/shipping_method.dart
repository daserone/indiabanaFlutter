// To parse this JSON data, do
//
//     final shippingMethods = shippingMethodsFromJson(jsonString);

import 'dart:convert';

List<ShippingMethods> shippingMethodsFromJson(String str) =>
    List<ShippingMethods>.from(
        json.decode(str).map((x) => ShippingMethods.fromJson(x)));

String shippingMethodsToJson(List<ShippingMethods> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShippingMethods {
  String? method;
  bool? checked;

  ShippingMethods({
    this.method,
    this.checked,
  });

  factory ShippingMethods.fromJson(Map<String, dynamic> json) =>
      ShippingMethods(
        method: json["method"],
        checked: json["checked"],
      );

  Map<String, dynamic> toJson() => {
        "method": method,
        "checked": checked,
      };
}
