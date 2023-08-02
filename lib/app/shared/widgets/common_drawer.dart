import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/data/storage/storage_service.dart';
import 'package:indiabana_app/app/shared/constants/constants.dart';
import 'package:indiabana_app/app/shared/widgets/profile_pic.dart';

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
            SizedBox(
              height: 220,
              child: Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: 200,
                    decoration: BoxDecoration(
                      color: ColorConstants.indiabanaDarkBlue,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Image.asset(
                          'assets/icons/logo.png',
                          height: 60,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, bottom: 8.0),
                              child: Text(
                                controller.token == ''
                                    ? 'Bienvenido a Indiabana'
                                    : controller.token ?? '',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  controller.token != ''
                      ? const Positioned(
                          bottom: 0,
                          child: ProfilePic(),
                        )
                      : Container()
                ],
              ),
            ),
            //mi cuenta header
            const ListTile(
              title: Text(
                'Mi cuenta',
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
              title: const Text('Inicio'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Preguntas'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Cuenta'),
              onTap: () {
                // Update the state of the app.
                // ...
                Get.back();
                Get.toNamed('login');
              },
            ),
            ListTile(
              title: const Text('Ayuda'),
              onTap: () {},
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
      ),
    );
  }
}
