import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/home/controllers/home_controller.dart';
import 'package:indiabana_app/app/modules/products/views/widgets/product_card.dart';
import 'package:indiabana_app/app/shared/constants/constants.dart';

import '../controllers/products_controller.dart';
import 'widgets/product_cat_card.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controllerHome = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: ColorConstants.indiabanaDarkBlue,
          ),
        ),
        title: const Text('Productos'),
        actions: [
          Obx(
            () => SizedBox(
              width: 120,
              child: DropdownButtonFormField(
                isExpanded: true,
                value: controller.selectedCategory == ''
                    ? null
                    : controller.selectedCategory,
                items: controllerHome.categories.map((cat) {
                  return DropdownMenuItem<String>(
                    value: cat.id,
                    child: Text(cat.name ?? ''),
                  );
                }).toList(),
                hint: const Text(
                  'Categoría',
                  style: TextStyle(color: Colors.white54),
                ),
                selectedItemBuilder: (BuildContext context) {
                  return controllerHome.categories.map<Widget>((item) {
                    return Text(
                      item.name ?? '',
                      style: const TextStyle(color: Colors.white),
                    );
                  }).toList();
                },
                onChanged: (val) {
                  controller.selectedCategory = val!;
                  controller.getProductsByCategory(val);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor seleccione una categoría';
                  }
                  return null;
                },
              ),
            ),
          )
        ],
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () => controller.refreshData(),
          child: controller.isFirstLoadRunning
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    //buscar productos
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              controller: controller.searchController,
                              style: const TextStyle(color: Colors.black),
                              onChanged: (value) {
                                if (controller.timer?.isActive ?? false) {
                                  controller.timer?.cancel();
                                }
                                controller.timer = Timer(
                                    const Duration(milliseconds: 500), () {
                                  // add your Code here to get the data after every given Duration
                                  controller.searchProducts();
                                });
                              },
                              cursorColor: Colors.white,
                              decoration: const InputDecoration(
                                  hintText: 'Buscar producto...',
                                  hintStyle: TextStyle(color: Colors.black54),
                                  border: InputBorder.none,
                                  suffixIcon: Icon(Icons.search)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    controller.selectedCategory == ''
                        ? Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 8.0),
                              child: GridView.builder(
                                shrinkWrap: true,
                                controller: controller.scrollController,
                                itemCount: controller.products.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 15,
                                        crossAxisSpacing: 15,
                                        mainAxisExtent: 230),
                                itemBuilder: (context, index) =>
                                    productCard(context, index),
                              ),
                            ),
                          )
                        : Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 8.0),
                              child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: controller.productsByCategory.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 15,
                                        crossAxisSpacing: 15,
                                        mainAxisExtent: 230),
                                itemBuilder: (context, index) =>
                                    productCatCard(context, index),
                              ),
                            ),
                          ),
                    if (controller.isLoadMoreRunning)
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                    if (!controller.isLoadMoreRunning &&
                        !controller.hasNextPage)
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text('No hay más productos'),
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                  ],
                ),
        ),
      ),
    );
  }
}
