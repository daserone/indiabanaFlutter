import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/new-product/controllers/new_product_controller.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/add_image.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/file_image.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/form_nav_buttons.dart';

class NewProductDesc extends StatelessWidget {
  const NewProductDesc({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewProductController>();
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Galería del producto',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.multipleImages.length,
                itemBuilder: (context, index) {
                  return controller.multipleImages[index].path != ''
                      ? fileImageProduct(context, controller, index)
                      : addImageProduct(context, controller, index);
                },
              ),
            ),
            const Text(
              'Descripción del producto',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Descripción del producto',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(
              height: 20,
            ),
            const FormNavButtons(),
          ],
        ));
  }
}
