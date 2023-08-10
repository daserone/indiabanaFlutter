import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/new-product/controllers/new_product_controller.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/form_nav_buttons.dart';
// import 'package:indiabana_app/app/shared/constants/constants.dart';
import 'package:flutter/services.dart';

class NewProductWarrantyRadio extends StatelessWidget {
  const NewProductWarrantyRadio({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewProductController>();
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Garantía del producto',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
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
          const SizedBox(
            height: 10,
          ),
          if (controller.productWarranty != 2)
            const Text(
              'Tiempo de garantía',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
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
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],

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
                    // color: ColorConstants.indiabanaDarkBlue,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  width: Get.width / 5,
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      fillColor: Colors.black,
                      hintText: 'Dias',
                    ),
                    onChanged: (String? newValue) {
                      controller.warrantyTypeProductController.text = newValue!;
                    },
                    selectedItemBuilder: (context) => <Widget>[
                      const Text(
                        'Días',
                        style: TextStyle(color: Colors.black),
                      ),
                      const Text(
                        'Meses',
                        style: TextStyle(color: Colors.black),
                      ),
                      const Text(
                        'Años',
                        style: TextStyle(color: Colors.black),
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
            ),
          const SizedBox(
            height: 20,
          ),
          // cancel and next buttons
          const FormNavButtons()
        ],
      ),
    );
  }
}
