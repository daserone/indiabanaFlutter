import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/home/views/widgets/banner_carousel.dart';
import 'package:indiabana_app/app/modules/home/views/widgets/banner_publicity.dart';
import 'package:indiabana_app/app/modules/home/views/widgets/categories_cards.dart';
import 'package:indiabana_app/app/modules/home/views/widgets/categories_list.dart';
import 'package:indiabana_app/app/modules/home/views/widgets/selected_category_products.dart';
import 'package:indiabana_app/app/shared/constants/constants.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const CategoriesList(),
          SizedBox(
            height: Get.height / 2.7,
            child: Stack(
              children: [
                const BannerCarousel(),
                Positioned(
                  top: Get.height / 3.4,
                  child: SizedBox(
                    height: 50,
                    width: Get.width,
                    child: Center(
                      child: SizedBox(
                        width: Get.width - 60,
                        child: EasySearchBar(
                          backgroundColor: Colors.white,
                          foregroundColor: ColorConstants.indiabanaDarkBlue,
                          onSearch: (val) {},
                          title: const Text(
                            'Buscar productos',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          asyncSuggestions: (val) async =>
                              await controller.searchProducts(val),
                          onSuggestionTap: (data) {
                            controller.getProductId(data);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const BannerPublicity(),
          const SizedBox(
            height: 20,
          ),
          const CategoriesCards(),
          const SizedBox(
            height: 20,
          ),
          const SelectedCategoryProducts(),
          // Center(
          //   child: ElevatedButton(
          //       onPressed: () {
          //         final controller = Get.find<AuthenticationManager>();
          //         controller.deleteUser();
          //       },
          //       child: const Text('dada')),
          // ),
        ],
      ),
    );
  }
}
