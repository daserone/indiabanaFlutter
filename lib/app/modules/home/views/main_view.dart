import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/home/controllers/home_controller.dart';
import 'package:indiabana_app/app/modules/home/views/cart_view.dart';
import 'package:indiabana_app/app/modules/home/views/home_view.dart';
import 'package:indiabana_app/app/modules/home/views/likes_view.dart';
import 'package:indiabana_app/app/modules/home/views/notifications_view.dart';
import 'package:indiabana_app/app/shared/constants/constants.dart';
import 'package:indiabana_app/app/shared/widgets/common_appbar.dart';
import 'package:indiabana_app/app/shared/widgets/common_drawer.dart';

class MainView extends GetView<HomeController> {
  const MainView({super.key});
  Widget buildPageView() {
    return PageView(
      controller: controller.pageController,
      onPageChanged: (index) {
        controller.pageChanged(index);
      },
      children: const <Widget>[
        HomeView(),
        LikesView(),
        NotificationsView(),
        CartView()
      ],
    );
  }

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Icon(Icons.home)),
          label: '',
          backgroundColor: ColorConstants.indiabanaDarkBlue),
      BottomNavigationBarItem(
          icon: const Icon(Icons.favorite),
          label: '',
          backgroundColor: ColorConstants.indiabanaDarkBlue),
      BottomNavigationBarItem(
          icon: const Icon(Icons.notifications_sharp),
          label: '',
          backgroundColor: ColorConstants.indiabanaDarkBlue),
      BottomNavigationBarItem(
          icon: const Icon(Icons.shopping_cart),
          label: '',
          backgroundColor: ColorConstants.indiabanaDarkBlue)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPageView(),
      appBar: const CommonAppBar(title: 'INDIABANA'),
      drawer: const CommonDrawer(),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            backgroundColor: ColorConstants.indiabanaDarkBlue,
            items: buildBottomNavBarItems(),
            currentIndex: controller.currentPage,
            onTap: (index) {
              controller.bottomTapped(index);
            },
          )),
    );
  }
}
