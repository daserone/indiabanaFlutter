import 'package:flutter/material.dart';
import 'package:indiabana_app/app/modules/new-product/controllers/new_product_controller.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/image_select_bottom_sheet.dart';

@override
Widget addImageVariant(BuildContext context, NewProductController controller) {
  return Container(
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
    child: imageSelect(context, controller, 0, true),
  );
}
