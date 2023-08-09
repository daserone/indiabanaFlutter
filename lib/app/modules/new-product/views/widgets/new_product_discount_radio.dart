import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/new-product/controllers/new_product_controller.dart';

class NewProductDiscountRadio extends StatelessWidget {
  const NewProductDiscountRadio({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewProductController>();
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            '¿Tiene descuento?',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),

          //radio condition list tile
          ListTile(
            title: const Text('Si'),
            leading: Radio<int>(
              value: 0,
              groupValue: controller.discountRadio,
              onChanged: (value) {
                controller.discountRadio = value!;
              },
            ),
          ),
          ListTile(
            title: const Text('No'),
            leading: Radio<int>(
              value: 1,
              groupValue: controller.discountRadio,
              onChanged: (value) {
                controller.discountRadio = value!;
              },
            ),
          ),
        ],
      ),
    );
  }
}
