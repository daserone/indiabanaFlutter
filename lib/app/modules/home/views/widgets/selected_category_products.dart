import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/home/controllers/home_controller.dart';
import 'package:indiabana_app/app/modules/home/views/widgets/products_cards.dart';
import 'package:indiabana_app/app/shared/constants/constants.dart';

class SelectedCategoryProducts extends StatelessWidget {
  const SelectedCategoryProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    controller.selectedCategory.name ?? '',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Ver todos',
                      style: TextStyle(color: ColorConstants.indiabanaOrange),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const ProductsCards()
            ],
          ),
        ));
  }
}
