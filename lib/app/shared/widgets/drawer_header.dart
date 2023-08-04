import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/data/storage/storage_service.dart';
import 'package:indiabana_app/app/shared/constants/constants.dart';
import 'package:indiabana_app/app/shared/widgets/profile_pic.dart';

class IndiabanaDrawerHeader extends StatelessWidget {
  const IndiabanaDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthenticationManager>();
    return Obx(
      () => SizedBox(
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
                        padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
                        child: Text(
                          controller.token == ''
                              ? 'Bienvenido a Indiabana'
                              : 'Bienvenido ${controller.profileUser?.name ?? ''}',
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
                ? Positioned(
                    bottom: 0,
                    left: 10,
                    child: ProfilePic(
                      imageUrl: controller.profileUser?.profileImage ?? '',
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
