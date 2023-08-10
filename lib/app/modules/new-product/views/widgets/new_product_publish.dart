import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/new-product/controllers/new_product_controller.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/form_nav_buttons.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/new_product_post_type_card.dart';

class NewProductPublish extends StatelessWidget {
  const NewProductPublish({super.key});

  @override
  Widget build(BuildContext context) {
    //controller
    final controller = Get.find<NewProductController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Seleccione un tipo de publicación',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10.0),
        Obx(() => SizedBox(
              height: 380,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.pubTypeList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      NewProductPostCardType(
                        index: index,
                      )),
            )),
        const SizedBox(height: 10.0),
        const FormNavButtons()
      ],
    );
  }
}
