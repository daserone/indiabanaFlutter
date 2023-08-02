import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/shared/constants/constants.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 2.1,
      width: Get.width,
      decoration: BoxDecoration(
        //radius border bottom
        color: ColorConstants.indiabanaOrange,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        image: DecorationImage(
            image: const NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCoIdrto0Ry1tD1dP8DdFvqWZI-PqS5ZVZ4w&usqp=CAU',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              const Color.fromARGB(255, 31, 19, 0).withOpacity(0.5),
              BlendMode.multiply,
            )),
      ),
      child: SizedBox(
        height: 100,
        width: 200,
        child: Image.asset(
          'assets/images/logo-indiabana.png',
        ),
      ),
    );
  }
}
