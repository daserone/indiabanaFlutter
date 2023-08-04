import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/data/storage/storage_service.dart';

class DrawerItemsBuyer extends StatelessWidget {
  const DrawerItemsBuyer({super.key});

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
        const ListTile(
          title: Text(
            'Mis compras',
          ),
        ),
        const ListTile(
          title: Text(
            'Configuración',
          ),
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
