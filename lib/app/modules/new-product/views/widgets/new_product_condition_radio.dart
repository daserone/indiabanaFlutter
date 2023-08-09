import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/new-product/controllers/new_product_controller.dart';

class NewProductConditionRadio extends StatelessWidget {
  const NewProductConditionRadio({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewProductController>();
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Condición del producto',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          //radio condition list tile
          ListTile(
            title: const Text('Nuevo'),
            leading: Radio<int>(
              value: 0,
              groupValue: controller.productCondition,
              onChanged: (value) {
                controller.productCondition = value!;
              },
            ),
          ),
          ListTile(
            title: const Text('Usado'),
            leading: Radio<int>(
              value: 1,
              groupValue: controller.productCondition,
              onChanged: (value) {
                controller.productCondition = value!;
              },
            ),
          ),
          ListTile(
            title: const Text('Reacondicionado'),
            leading: Radio<int>(
              value: 2,
              groupValue: controller.productCondition,
              onChanged: (value) {
                controller.productCondition = value!;
              },
            ),
          ),
        ],
      ),
    );
  }
}
