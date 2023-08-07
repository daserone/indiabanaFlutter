import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/ProductDetails/views/widgets/product_add_question.dart';
import 'package:indiabana_app/app/modules/ProductDetails/views/widgets/product_bottom_bar.dart';
import 'package:indiabana_app/app/modules/ProductDetails/views/widgets/product_description.dart';
import 'package:indiabana_app/app/modules/ProductDetails/views/widgets/product_details.dart';
import 'package:indiabana_app/app/modules/ProductDetails/views/widgets/product_gallery.dart';
import 'package:indiabana_app/app/modules/ProductDetails/views/widgets/product_related_list.dart';
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
      bottomNavigationBar: const ProductBottomBar(),

      body: Obx(() {
        return controller.loadingProduct
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.product.product == null
                ? const Center(
                    child: Text('No se encontró el producto'),
                  )
                : ListView(
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
                      const ProductDetails(),
                      const ProductDescription(),
                      const ProductAddQuestion(),
                      const SizedBox(
                        height: 20,
                      ),
                      //related label
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text(
                              'Productos relacionados',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const ProductRelatedList()
                    ],
                  );
      }),
    );
  }
}
