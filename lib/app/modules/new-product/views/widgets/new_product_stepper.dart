import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/new-product/controllers/new_product_controller.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/new_product_category.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/new_product_condition.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/new_product_name.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/new_product_shipping.dart';

class NewProductStepper extends StatelessWidget {
  const NewProductStepper({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewProductController>();
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            key: controller.formKey,
            child: controller.currentStep == 0
                ? NewProductName()
                : controller.currentStep == 1
                    ? NewProductCategory()
                    : controller.currentStep == 2
                        ? NewProductCondition()
                        : controller.currentStep == 3
                            ? NewProductShipping()
                            : const Text('')),
      ),
    );
  }
}
