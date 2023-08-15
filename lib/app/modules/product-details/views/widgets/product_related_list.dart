import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/data/models/response/products_related_response.dart';
import 'package:indiabana_app/app/modules/product-details/controllers/product_details_controller.dart';

class ProductRelatedList extends StatelessWidget {
  const ProductRelatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductDetailsController>();
    return Obx(() {
      return controller.loadingRelated
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : controller.relatedProducts.isEmpty
              ? const SizedBox(
                  height: 100,
                  child: Center(
                      child: Text('No se encontraron productos relacionados')),
                )
              : Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    height: 280,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.relatedProducts.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Product product = controller.relatedProducts[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            width: 160,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: product.images?[0] ?? '',
                                  height: 100,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(product.name ?? ''),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Marca: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Flexible(
                                            child: Text(
                                              product.brand ?? '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Text(
                                            "\$",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Flexible(
                                            child: Text(
                                              product.price?.toString() ?? '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  const TextStyle(fontSize: 22),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 2),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          try {
                                            log(product.id!);
                                            controller
                                                .getProductById(product.id!);
                                          } catch (e) {
                                            log(e.toString());
                                          }
                                        },
                                        child: SizedBox(
                                          width: Get.width,
                                          child: const Center(
                                              child: Text(
                                            'COMPRAR',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700),
                                          )),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                );
    });
  }
}
