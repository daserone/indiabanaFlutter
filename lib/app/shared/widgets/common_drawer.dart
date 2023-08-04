import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/data/storage/storage_service.dart';
import 'package:indiabana_app/app/shared/widgets/drawer_header.dart';
import 'package:indiabana_app/app/shared/widgets/drawer_logged.dart';
import 'package:indiabana_app/app/shared/widgets/drawer_not_logged.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthenticationManager>();
    return Obx(
      () => Drawer(
        child: Column(
          // Important: Remove any padding from the ListView.

          children: [
            const IndiabanaDrawerHeader(),
            Expanded(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: controller.token == ''
                    ? const <Widget>[
                        DrawerItemsNotLogged(),
                      ]
                    : const <Widget>[
                        DrawerItemsLogged(),
                      ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
