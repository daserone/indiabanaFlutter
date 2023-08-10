import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/new-product/controllers/new_product_controller.dart';

@override
Widget imageSelect(BuildContext context, NewProductController controller,
    int index, bool isVariant) {
  return IconButton(
    onPressed: () {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 150,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.camera),
                  title: const Text('Cámara'),
                  onTap: () async {
                    controller.getImageFromCamera(index, isVariant);
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text('Galería'),
                  onTap: () async {
                    controller.getImageFromGallery(index, isVariant);
                    Get.back();
                  },
                ),
              ],
            ),
          );
        },
      );
    },
    icon: const Icon(
      Icons.add_photo_alternate_rounded,
      size: 50,
    ),
  );
}
