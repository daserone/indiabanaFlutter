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
        const Text(
          'Seleccione una categoría de producto',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        DropdownButtonFormField(
          value: controller.categoryProductController.text == ''
              ? null
              : controller.categoryProductController.text,
          items: homeController.categories.map((cat) {
            return DropdownMenuItem<String>(
              value: cat.id,
              child: Text(cat.name ?? ''),
            );
          }).toList(),
          onChanged: (val) {
            controller.categoryProductController.text = val!;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor seleccione una categoría';
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
                controller.previousStep();
              },
              child: Text(
                'Atrás',
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
