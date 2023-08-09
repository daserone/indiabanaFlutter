import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/new-product/controllers/new_product_controller.dart';

class FormNavButtons extends StatelessWidget {
  const FormNavButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewProductController>();
    return Row(
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
    );
  }
}
