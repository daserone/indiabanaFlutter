import 'package:flutter/material.dart';

import 'package:indiabana_app/app/modules/new-product/views/widgets/new_product_condition_radio.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/new_product_warranty_radio.dart';

class NewProductCondition extends StatelessWidget {
  const NewProductCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [NewProductConditionRadio(), NewProductWarrantyRadio()],
    );
  }
}
