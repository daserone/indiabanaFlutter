import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/data/models/response/products_all_response.dart';
import 'package:indiabana_app/app/modules/products/controllers/products_controller.dart';

@override
Widget productCard(BuildContext context, index) {
  final controller = Get.find<ProductsController>();
  Doc product = controller.products[index];
  return Card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          fit: BoxFit.cover,
          height: 130,
          width: Get.width,
          imageUrl: product.mainImage ?? '',
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name ?? '',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

              //marca
              Text(
                "Marca: ${product.brand ?? ''}",
                style: const TextStyle(fontSize: 14),
              ),
              Text("\$ ${product.price ?? ''}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black)),
            ],
          ),
        ),
      ],
    ),
  );
}
