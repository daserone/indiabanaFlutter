import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/new-product/controllers/new_product_controller.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/form_nav_buttons.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/new_product_discount_radio.dart';
import 'package:indiabana_app/app/shared/constants/constants.dart';

class NewProductPrice extends StatelessWidget {
  const NewProductPrice({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewProductController>();
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Precio e inventario',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextFormField(
            controller: controller.priceProductController,
            decoration: const InputDecoration(
              label: Text('Precio de venta'),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese un precio';
              }
              return null;
            },
          ),
          TextFormField(
            controller: controller.inventoryProductController,
            decoration: const InputDecoration(
              label: Text('Inventario'),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese una cantidad';
              }
              return null;
            },
          ),

          TextFormField(
            controller: controller.skuProductController,
            decoration: const InputDecoration(
              label: Text('SKU'),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese un SKU';
              }
              return null;
            },
          ),
          //discount radio
          const NewProductDiscountRadio(),
          if (controller.discountRadio == 0)
            Column(
              children: [
                TextFormField(
                  controller: controller.discountProductController,
                  decoration: const InputDecoration(
                    label: Text('Precio con descuento'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un descuento';
                    }
                    return null;
                  },
                ),
                //from to textfield

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.discountFromProductController,
                        readOnly: true,
                        decoration: InputDecoration(
                          label: const Text('Desde'),
                          suffixIcon: IconButton(
                            iconSize: 16,
                            icon: const Icon(Icons.calendar_today),
                            onPressed: () async {
                              var picker = await showDatePicker(
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: ColorConstants
                                              .indiabanaOrange, // header background color
                                          // header text color
                                          // body text color
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            foregroundColor: ColorConstants
                                                .indiabanaDarkBlue, // button text color
                                          ),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                  context: context,
                                  locale: const Locale("es", "ES"),
                                  initialDate: DateTime.now(),
                                  firstDate:
                                      DateTime(1900, DateTime.now().month),
                                  lastDate: DateTime(2101));

                              if (picker != null) {
                                controller.discountFromProductController.text =
                                    "${picker.year}-${picker.month.toString().padLeft(2, '0')}-${picker.day.toString().padLeft(2, '0')}";
                              }
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese una fecha';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller.discountToProductController,
                        readOnly: true,
                        decoration: InputDecoration(
                            label: const Text('Hasta'),
                            suffixIcon: IconButton(
                              iconSize: 16,
                              icon: const Icon(Icons.calendar_today),
                              onPressed: () async {
                                var picker = await showDatePicker(
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                            primary: ColorConstants
                                                .indiabanaOrange, // header background color
                                            // header text color
                                            // body text color
                                          ),
                                          textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                              foregroundColor: ColorConstants
                                                  .indiabanaDarkBlue, // button text color
                                            ),
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    },
                                    context: context,
                                    locale: const Locale("es", "ES"),
                                    initialDate: DateTime.now(),
                                    firstDate:
                                        DateTime(1900, DateTime.now().month),
                                    lastDate: DateTime(2101));

                                if (picker != null) {
                                  controller.discountToProductController.text =
                                      "${picker.year}-${picker.month.toString().padLeft(2, '0')}-${picker.day.toString().padLeft(2, '0')}";
                                }
                              },
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese una fecha';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
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
