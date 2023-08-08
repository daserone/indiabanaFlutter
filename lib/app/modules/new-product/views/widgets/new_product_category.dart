import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/home/controllers/home_controller.dart';
import 'package:indiabana_app/app/modules/new-product/controllers/new_product_controller.dart';

class NewProductCategory extends StatelessWidget {
  const NewProductCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewProductController>();
    final homeController = Get.find<HomeController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Seleccione una categoría de producto'),
        DropdownButtonFormField(
            items: homeController.categories.map((cat) {
              return DropdownMenuItem<String>(
                value: cat.id,
                child: Text(cat.name ?? ''),
              );
            }).toList(),
            onChanged: (val) {
              controller.categoryProductController.text = val!;
            }),
      ],
    );
  }
}
