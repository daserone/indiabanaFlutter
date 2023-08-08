import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/new-product/controllers/new_product_controller.dart';

class NewProductName extends StatelessWidget {
  const NewProductName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewProductController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '¿Que estas vendiendo?',
        ),
        TextFormField(
          controller: controller.nameProductController,
          decoration: const InputDecoration(
            hintText: 'Ej: SmartTv LG 42"',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor ingrese un nombre de producto';
            }
            return null;
          },
        ),
      ],
    );
  }
}
