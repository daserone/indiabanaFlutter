import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/data/storage/storage_service.dart';

class DrawerItemsSeller extends StatelessWidget {
  const DrawerItemsSeller({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthenticationManager>();

    return Column(
      children: [
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
          title: const Text(
            'Mis ventas',
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        //alianzas
        ListTile(
          title: const Text(
            'Alianzas',
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        //publicar
        ListTile(
          title: const Text(
            'Publicar',
          ),
          onTap: () {
            Get.toNamed('new-product');
          },
        ),
        //billing
        ListTile(
          title: const Text(
            'Facturación',
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),

        ListTile(
          title: const Text(
            'Configuración',
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        //inventarios
        ListTile(
          title: const Text(
            'Inventarios',
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text(
            'Cerrar Sesión',
          ),
          onTap: controller.deleteUser,
        ),
        ListTile(
          title: const Text('Ayuda'),
          onTap: () {},
        ),
      ],
    );
  }
}
