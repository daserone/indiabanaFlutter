import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/data/models/response/products_cat_response.dart';
import 'package:indiabana_app/app/modules/products/controllers/products_controller.dart';

@override
Widget productCatCard(BuildContext context, index) {
  final controller = Get.find<ProductsController>();
  ProductElement product = controller.productsByCategory[index];
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
                product.product?.name ?? '',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

              //marca
              Text(
                "Marca: ${product.product?.brand ?? ''}",
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
