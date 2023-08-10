import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/new-product/controllers/new_product_controller.dart';
import 'package:flutter/services.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/add_image_variant.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/file_image_variant.dart';

import '../../../../shared/constants/constants.dart';
import 'new_product_discount_radio.dart';

class NewProductVariant extends StatelessWidget {
  const NewProductVariant({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewProductController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Nueva Variante'),
        centerTitle: false,
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: controller.variantFormKey,
            child: ListView(
              children: [
                //current product name

                Text(
                  'Variante del producto: ${controller.nameProductController.text}',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                //variante
                TextFormField(
                  controller: controller.variantProductController,
                  decoration: const InputDecoration(
                      label: Text('Nombre de la variante'),
                      hintText: 'Ej:Talla'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un nombre de variante';
                    }
                    return null;
                  },
                ),
                //variant value
                TextFormField(
                  controller: controller.variantValueProductController,
                  decoration: const InputDecoration(
                      label: Text('Valor de la variante'), hintText: 'Ej: 36'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un valor de variante';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.variantPriceProductController,
                  decoration: const InputDecoration(
                    label: Text('Precio de venta'),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un precio';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.variantInventoryProductController,
                  decoration: const InputDecoration(
                    label: Text('Inventario'),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese una cantidad';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: controller.variantSkuProductController,
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
                const NewProductDiscountRadio(
                  isVariant: true,
                ),
                if (controller.variantDiscountRadio == 1)
                  Column(
                    children: [
                      TextFormField(
                        controller: controller.variantDiscountProductController,
                        decoration: const InputDecoration(
                          label: Text('Precio con descuento'),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
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
                              controller: controller
                                  .variantDiscountFromProductController,
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
                                              textButtonTheme:
                                                  TextButtonThemeData(
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
                                        firstDate: DateTime(
                                            1900, DateTime.now().month),
                                        lastDate: DateTime(2101));

                                    if (picker != null) {
                                      controller
                                              .variantDiscountFromProductController
                                              .text =
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
                              controller:
                                  controller.variantDiscountToProductController,
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
                                                textButtonTheme:
                                                    TextButtonThemeData(
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
                                          firstDate: DateTime(
                                              1900, DateTime.now().month),
                                          lastDate: DateTime(2101));

                                      if (picker != null) {
                                        controller
                                                .variantDiscountToProductController
                                                .text =
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
                //variant image
                const SizedBox(
                  height: 20,
                ),
                const Text('Imagen de la variante',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                    height: 170,
                    width: 170,
                    child: controller.variantImage.path != ''
                        ? fileImageVariant(context, controller)
                        : addImageVariant(context, controller),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                //agregar variante
                ElevatedButton(
                  onPressed: () {
                    if (controller.variantFormKey.currentState!.validate()) {
                      controller.addVariant();
                    }
                  },
                  child: const Text('Agregar variante'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
