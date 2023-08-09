import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/new_product_stepper.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/new_product_stepper_header.dart';

import '../controllers/new_product_controller.dart';

class NewProductView extends GetView<NewProductController> {
  const NewProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Producto'),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          NewProductStepperHeader(),
          NewProductStepper(),
        ],
      ),
    );
  }
}
