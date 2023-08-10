import 'dart:io';

import 'package:flutter/material.dart';
import 'package:indiabana_app/app/modules/new-product/controllers/new_product_controller.dart';

@override
Widget fileImageProduct(
    BuildContext context, NewProductController controller, int index) {
  return Stack(
    children: [
      Container(
        margin: const EdgeInsets.all(5.0),
        width: 170,
        height: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        child: Image.file(
          File(controller.productImages[index].path),
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
        top: 10,
        right: 10,
        child: InkWell(
          onTap: () {
            controller.deleteImage(index);
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
