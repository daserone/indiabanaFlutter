import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/data/storage/storage_service.dart';

class DrawerItemsNotLogged extends StatelessWidget {
  const DrawerItemsNotLogged({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthenticationManager>();
    return Column(
      children: [
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
          title: Text(
            controller.token == '' ? 'Iniciar Sesión' : 'Cerrar Sesión',
          ),
          onTap: () {
            // Update the state of the app.
            // ...
            controller.token == ''
                ? Get.toNamed('login')
                : controller.deleteUser();
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
    );
  }
}
