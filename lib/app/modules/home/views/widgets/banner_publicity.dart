import 'package:flutter/material.dart';

class BannerPublicity extends StatelessWidget {
  const BannerPublicity({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: Text('Todo para tu vehículo en cuestión de HORAS'),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 100,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/vehicleBanner.png'))),
        ),
      ],
    );
  }
}
