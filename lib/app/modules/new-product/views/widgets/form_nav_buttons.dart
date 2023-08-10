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
              if (controller.currentStep == 4) {
                //check if at least one shipping methods is checked

                if (controller.shippingMethods
                    .where((element) => element.checked!)
                    .isEmpty) {
                  controller.shippingError = true;
                  return;
                } else {
                  controller.shippingError = false;
                }
                if (controller.shippingExpenses != 0) {
                  if (controller.shippingList.isEmpty) {
                    controller.shippingListError = true;
                    return;
                  } else {
                    controller.shippingListError = false;
                  }
                }
              }
              if (controller.currentStep == 5) {
                //check if at least one product image has path
                if (controller.productImages
                    .where((element) => element.path != '')
                    .isEmpty) {
                  controller.imagesError = true;
                  return;
                } else {
                  controller.imagesError = false;
                }
              }
              if (controller.currentStep == 7) {
                //publish
                controller.publishProduct();
                return;
              }

              controller.nextStep();
            }
          },
          child: Text(
            controller.currentStep != 7 ? 'Siguiente' : 'Publicar',
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
