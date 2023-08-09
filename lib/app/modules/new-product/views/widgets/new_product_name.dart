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
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
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
        const SizedBox(
          height: 20,
        ),
        // cancel and next buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                if (controller.formKey.currentState!.validate()) {
                  controller.nextStep();
                }
              },
              child: const Text(
                'Siguiente',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            TextButton(
              onPressed: () {
                // controller.cancel();
              },
              child: Text(
                'Cancelar',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
