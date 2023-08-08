import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewProductController extends GetxController {
  //stepper index
  RxInt _currentStep = 0.obs;
  int get currentStep => _currentStep.value;
  set currentStep(int value) => _currentStep.value = value;
  //form key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //textcontrollers
  TextEditingController nameProductController = TextEditingController();
  TextEditingController categoryProductController = TextEditingController();
  //marca
  TextEditingController brandProductController = TextEditingController();
  //modelo
  TextEditingController modelProductController = TextEditingController();
  //sku
  TextEditingController skuProductController = TextEditingController();
  //ficha tecnica
  TextEditingController technicalSheetProductController =
      TextEditingController();
  //peso
  TextEditingController weightProductController = TextEditingController();
  //alto
  TextEditingController heightProductController = TextEditingController();
  //ancho
  TextEditingController widthProductController = TextEditingController();
  //largo
  TextEditingController lengthProductController = TextEditingController();

  //warranty time
  TextEditingController warrantyTimeProductController = TextEditingController();
  //warranty type
  TextEditingController warrantyTypeProductController = TextEditingController();

  //radio product condition
  RxInt _productCondition = 0.obs;
  int get productCondition => _productCondition.value;
  set productCondition(int value) => _productCondition.value = value;
  //radio product warranty
  RxInt _productWarranty = 0.obs;
  int get productWarranty => _productWarranty.value;
  set productWarranty(int value) => _productWarranty.value = value;
  //change step
  void changeStep(int index) {
    currentStep = index;
  }
}
