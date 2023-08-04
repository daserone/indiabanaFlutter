import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/data/storage/storage_service.dart';
import 'package:indiabana_app/app/shared/constants/constants.dart';
import 'package:indiabana_app/app/shared/widgets/drawer_items_buyer.dart';
import 'package:indiabana_app/app/shared/widgets/drawer_items_seller.dart';

class DrawerItemsLogged extends StatelessWidget {
  const DrawerItemsLogged({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthenticationManager>();
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          //mi cuenta header
          TabBar(
              indicatorColor: ColorConstants.indiabanaDarkBlue,
              onTap: (index) {
                controller.changeTabIndex(index);
              },
              tabs: const [
                Tab(
                  text: 'Comprador',
                ),
                Tab(
                  text: 'Vendedor',
                ),
              ]),
          Obx(
            () => SizedBox(
              height: controller.tabIndex == 0
                  ? Get.height / 2.7
                  : Get.height / 1.6,
              child: const TabBarView(
                children: [
                  DrawerItemsBuyer(),
                  DrawerItemsSeller(),
                ],
              ),
            ),
          ),
          // enlaces de interés header
          const ListTile(
            title: Text(
              'Enlaces de interés',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            shape: Border(
              bottom: BorderSide(color: Colors.grey, width: 0.5),
            ),
          ),
          ListTile(
            title: const Text('Anunciar en indiabana'),
            onTap: () {},
          ),
          ListTile(
            title: const Text(' Como funciona indiabana?'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Acerca de Indiabana'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Calificar Aplicación'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
