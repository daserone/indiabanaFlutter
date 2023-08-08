import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/new-product/controllers/new_product_controller.dart';
import 'package:indiabana_app/app/shared/constants/constants.dart';

class NewProductWarrantyRadio extends StatelessWidget {
  const NewProductWarrantyRadio({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewProductController>();
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Garantía del producto',
          ),
          //radio condition list tile
          ListTile(
            title: const Text('Garantía por el vendedor'),
            leading: Radio<int>(
              value: 0,
              groupValue: controller.productWarranty,
              onChanged: (value) {
                controller.productWarranty = value!;
              },
            ),
          ),
          ListTile(
            title: const Text('Garantía de fabrica'),
            leading: Radio<int>(
              value: 1,
              groupValue: controller.productWarranty,
              onChanged: (value) {
                controller.productWarranty = value!;
              },
            ),
          ),
          ListTile(
            title: const Text('Sin Garantía'),
            leading: Radio<int>(
              value: 2,
              groupValue: controller.productWarranty,
              onChanged: (value) {
                controller.productWarranty = value!;
              },
            ),
          ),
          if (controller.productWarranty != 2)
            const Text(
              'Tiempo de garantía',
            ),

          if (controller.productWarranty != 2)
            Row(
              children: [
                SizedBox(
                  width: Get.width / 2.5,
                  child:
                      //textfield
                      TextFormField(
                    controller: controller.warrantyTimeProductController,
                    //only numbers
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Tiempo de garantía',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese un tiempo de garantía';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                // dropdown days,months,years
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorConstants.indiabanaDarkBlue,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  width: Get.width / 5,
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Dias',
                    ),
                    onChanged: (String? newValue) {
                      controller.warrantyTypeProductController.text = newValue!;
                    },
                    selectedItemBuilder: (context) => <Widget>[
                      const Text(
                        'Días',
                        style: TextStyle(color: Colors.white),
                      ),
                      const Text(
                        'Meses',
                        style: TextStyle(color: Colors.white),
                      ),
                      const Text(
                        'Años',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                    value: controller.warrantyTypeProductController.text == ''
                        ? 'Días'
                        : controller.warrantyTypeProductController.text,
                    items: <String>[
                      'Días',
                      'Meses',
                      'Años',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                )
              ],
            )
        ],
      ),
    );
  }
}
