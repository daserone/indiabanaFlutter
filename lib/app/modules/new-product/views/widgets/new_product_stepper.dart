import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/new-product/controllers/new_product_controller.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/new_product_category.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/new_product_condition.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/new_product_data.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/new_product_name.dart';
import 'package:indiabana_app/app/shared/constants/constants.dart';

class NewProductStepper extends StatelessWidget {
  const NewProductStepper({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewProductController>();
    return Obx(
      () => Form(
        key: controller.formKey,
        child: Stepper(
          type: StepperType.vertical,
          currentStep: controller.currentStep,
          controlsBuilder: (context, details) => Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.changeStep(controller.currentStep + 1);
                },
                child: const Text('Continuar'),
              ),
              TextButton(
                onPressed: () {
                  controller.changeStep(controller.currentStep - 1);
                },
                child: controller.currentStep == 0
                    ? Text('Cancelar',
                        style:
                            TextStyle(color: ColorConstants.indiabanaDarkBlue))
                    : Text(
                        'Atrás',
                        style:
                            TextStyle(color: ColorConstants.indiabanaDarkBlue),
                      ),
              ),
            ],
          ),
          onStepTapped: (index) {
            controller.changeStep(index);
          },
          steps: const <Step>[
            Step(
              title: Text('Nombre del producto'),
              content: NewProductName(),
            ),
            Step(
              title: Text('Categoría'),
              content: NewProductCategory(),
            ),
            Step(
              title: Text('Ficha técnica'),
              content: NewProductData(),
            ),
            Step(
              title: Text('Condición y Garantía'),
              content: NewProductCondition(),
            ),
            Step(
              title: Text('Condición y Garantía'),
              content: NewProductCondition(),
            ),
            //product details
            Step(
              title: Text('Detalles del producto'),
              content: NewProductCondition(),
            ),
          ],
        ),
      ),
    );
  }
}
