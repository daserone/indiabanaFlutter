import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/ProductDetails/controllers/product_details_controller.dart';

class ProductAddQuestion extends StatelessWidget {
  const ProductAddQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductDetailsController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: controller.addProductFormKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            //preguntas label
            const Row(
              children: [
                Text(
                  'Preguntas',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: TextFormField(
                  minLines: 3,
                  maxLines: 3,
                  controller: controller.addProductTextController,
                  decoration: const InputDecoration(
                    hintText: 'Preguntar al vendedor',
                    //input border rounded
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese su pregunta';
                    }
                    return null;
                  }),
            ),
            const SizedBox(height: 20),
            //enviar pregunta button
            SizedBox(
              width: Get.width,
              height: 50,
              child: ElevatedButton(
                onPressed: controller.sendQuestion,
                child: const Text('Enviar pregunta'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
