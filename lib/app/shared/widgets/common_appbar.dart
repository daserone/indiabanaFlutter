import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/home/controllers/home_controller.dart';
import 'package:indiabana_app/app/shared/constants/color_constants.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return EasySearchBar(
      onSearch: (val) {},
      title: const Center(
        child: Text(
          'INDIABANA',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      searchBackgroundColor: ColorConstants.indiabanaDarkBlue,
      asyncSuggestions: (val) async => await controller.searchProducts(val),
      onSuggestionTap: (data) {
        controller.getProductId(data);
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
