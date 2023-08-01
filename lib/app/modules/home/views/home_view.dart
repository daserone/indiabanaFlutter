import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/home/views/widgets/banner_carousel.dart';
import 'package:indiabana_app/app/modules/home/views/widgets/banner_publicity.dart';
import 'package:indiabana_app/app/modules/home/views/widgets/categories_cards.dart';
import 'package:indiabana_app/app/modules/home/views/widgets/categories_list.dart';
import 'package:indiabana_app/app/modules/home/views/widgets/selected_category_products.dart';
import 'package:indiabana_app/app/shared/constants/constants.dart';
import 'package:indiabana_app/app/shared/widgets/common_appbar.dart';
import 'package:indiabana_app/app/shared/widgets/common_drawer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'INDIABANA'),
      body: ListView(
        children: [
          const CategoriesList(),
          SizedBox(
            height: Get.height / 2.7,
            child: Stack(
              children: [
                const BannerCarousel(),
                Positioned(
                    top: 260,
                    child: SizedBox(
                      height: 100,
                      width: Get.width,
                      child: Center(
                        child: SizedBox(
                          width: Get.width - 60,
                          child: TextFormField(
                            obscureText: true,
                            autofocus: false,
                            decoration: InputDecoration(
                                hintText: 'Buscar productos...',
                                hintStyle: const TextStyle(
                                    fontSize: 16, color: Colors.black45),
                                fillColor: Colors.white,
                                filled: true,
                                suffixIcon: Material(
                                  elevation: 1.0,
                                  color: ColorConstants.indiabanaOrange,
                                  shadowColor: ColorConstants.indiabanaOrange,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                  ),
                                  child: const Icon(Icons.search,
                                      color: Colors.white),
                                ),
                                contentPadding: const EdgeInsets.fromLTRB(
                                    20.0, 10.0, 20.0, 10.0),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 3.0))),
                          ),
                        ),
                      ),
                    ))
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
      drawer: const CommonDrawer(),
    );
  }
}
