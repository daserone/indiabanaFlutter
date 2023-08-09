// To parse this JSON data, do
//
//     final newProductPubTypes = newProductPubTypesFromJson(jsonString);

import 'dart:convert';

List<NewProductPubTypes> newProductPubTypesFromJson(String str) =>
    List<NewProductPubTypes>.from(
        json.decode(str).map((x) => NewProductPubTypes.fromJson(x)));

String newProductPubTypesToJson(List<NewProductPubTypes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewProductPubTypes {
  String? type;
  String? duration;
  String? exposure;
  String? sales;
  String? stock;
  String? commissions;

  NewProductPubTypes({
    this.type,
    this.duration,
    this.exposure,
    this.sales,
    this.stock,
    this.commissions,
  });

  factory NewProductPubTypes.fromJson(Map<String, dynamic> json) =>
      NewProductPubTypes(
        type: json["type"],
        duration: json["duration"],
        exposure: json["exposure"],
        sales: json["sales"],
        stock: json["stock"],
        commissions: json["commissions"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "duration": duration,
        "exposure": exposure,
        "sales": sales,
        "stock": stock,
        "commissions": commissions,
      };
}
