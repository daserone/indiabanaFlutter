import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/product-details/controllers/product_details_controller.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductDetailsController>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            controller.product.product?.name ?? '',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        //state
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              const Text(
                'Estado: ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                controller.product.product?.condition ?? '',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        //seller
        // Padding(
        //   padding: const EdgeInsets.all(15.0),
        //   child: Row(
        //     children: [
        //       const Text(
        //         'Vendido por: ',
        //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        //       ),
        //       Text(
        //         controller.product.seller ?? '',
        //         style: const TextStyle(fontSize: 16),
        //       ),
        //     ],
        //   ),
        // ),
        //shipping
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              const Text(
                'Envíos: ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                controller.product.product?.shippingMethod
                        ?.join(', ')
                        .toUpperCase() ??
                    '',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        //rating
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(children: [
            RatingBar(
              initialRating:
                  //int to doble
                  controller.product.product?.score?.toDouble() ?? 0.0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              ratingWidget: RatingWidget(
                full: const Icon(Icons.star, color: Colors.amber),
                half: const Icon(Icons.star_half, color: Colors.amber),
                empty: const Icon(Icons.star_border, color: Colors.amber),
              ),
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              onRatingUpdate: (rating) {
                // print(rating);
              },
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "(${controller.product.product?.scoreCount?.toString() ?? ''})",
              style: const TextStyle(fontSize: 16),
            ),
          ]),
        ),
        //price
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              const Text(
                'Precio: ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                '\$${controller.product.price?.toString() ?? ''}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
