import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/new-product/controllers/new_product_controller.dart';

class NewProductData extends StatelessWidget {
  const NewProductData({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewProductController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller.brandProductController,
          decoration: const InputDecoration(
            label: Text('Marca'),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor ingrese una marca';
            }
            return null;
          },
        ),
        TextFormField(
          controller: controller.modelProductController,
          decoration: const InputDecoration(
            label: Text('Modelo'),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor ingrese un modelo';
            }
            return null;
          },
        ),
        //codigo del producto
        TextFormField(
          controller: controller.skuProductController,
          decoration: const InputDecoration(
            label: Text('Código del producto'),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor ingrese un código de producto';
            }
            return null;
          },
        ),
        //ficha tecnica
        TextFormField(
          controller: controller.technicalSheetProductController,
          decoration: const InputDecoration(
            label: Text('Ficha técnica'),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor ingrese una ficha técnica';
            }
            return null;
          },
        ),
        //peso
        TextFormField(
          controller: controller.weightProductController,
          decoration: const InputDecoration(
            label: Text('Peso'),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor ingrese un peso';
            }
            return null;
          },
        ),
        //dimensiones altura en cm
        TextFormField(
          controller: controller.heightProductController,
          decoration: const InputDecoration(
            label: Text('Dimensiones(altura en cm)'),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor ingrese una altura';
            }
            return null;
          },
        ),
        //dimensiones ancho en cm
        TextFormField(
          controller: controller.widthProductController,
          decoration: const InputDecoration(
            label: Text('Dimensiones(ancho en cm)'),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor ingrese un ancho';
            }
            return null;
          },
        ),
        //dimensiones largo en cm
        TextFormField(
          controller: controller.lengthProductController,
          decoration: const InputDecoration(
            label: Text('Dimensiones(largo en cm)'),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor ingrese un largo';
            }
            return null;
          },
        ),
      ],
    );
  }
}
