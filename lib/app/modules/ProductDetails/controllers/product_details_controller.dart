import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/data/models/response/products_cat_response.dart';
import 'package:indiabana_app/app/shared/configs/logger_service.dart';

class ProductDetailsController extends GetxController {
  //product
  Rx<ProductElement> _product = ProductElement().obs;
  ProductElement get product => _product.value;
  set product(ProductElement value) => _product.value = value;

  @override
  void onInit() {
    LoggerService().infoLog('DETAILS');
    debugPrint(Get.arguments.toString());
    product = Get.arguments['product'];
    super.onInit();
  }

  @override
  void onClose() {
    LoggerService().infoLog('CLOSE');

    product = ProductElement();
    super.onClose();
  }
}
