import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/ProductDetails/views/widgets/product_gallery.dart';
import 'package:indiabana_app/app/shared/constants/constants.dart';

import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del producto'),
        centerTitle: true,
      ),
      // cart and buy bottom navbar
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        height: 100,
        decoration: BoxDecoration(
          color: ColorConstants.indiabanaDarkBlue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //cart
            SizedBox(
              width: Get.width / 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const SizedBox(
                    width: 100,
                    child: Text(
                      'Agregar al carrito',
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        //bold
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //buy
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorConstants.indiabanaOrange,
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_bag,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),

      body: ListView(
        children: [
          Stack(
            children: [
              const ProductGallery(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConstants.indiabanaDarkBlue),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        )),
                  ),
                ),
              )
            ],
          ),
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                const Text(
                  'Vendido por: ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  controller.product.seller?.name ?? '',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          //shipping
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                const Text(
                  'Envio: ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  controller.product.product?.shippingMethod?[0]
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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Descripción del producto',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.product.product?.description ?? '',
                    style: const TextStyle(fontSize: 16),
                  ),
                  //report
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Reportar producto',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.indiabanaOrange),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
