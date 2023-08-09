import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/data/models/shipping_list.dart';
import 'package:indiabana_app/app/data/models/shipping_method.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class NewProductController extends GetxController {
  //stepper index
  RxInt _currentStep = 0.obs;
  int get currentStep => _currentStep.value;
  set currentStep(int value) => _currentStep.value = value;
  //scroll controller
  AutoScrollController scrollController = AutoScrollController();
  //steps list strings
  List<String> steps = [
    'Nombre del producto',
    'Categoría',
    'Condición',
    'Envíos',
    'Datos y Galería',
    'Fotos',
    'Precio e Inventario',
    'Publicar'
  ];
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
  //shipping company
  TextEditingController shippingCompanyProductController =
      TextEditingController();
  //shipping price
  TextEditingController shippingPriceProductController =
      TextEditingController();
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

  //list shipping methods
  RxList<ShippingMethods> _shippingMethods = <ShippingMethods>[
    ShippingMethods(method: 'ICarry', checked: false),
    ShippingMethods(method: 'Retiro en tienda', checked: false),
    ShippingMethods(method: 'Otros', checked: false),
  ].obs;
  List<ShippingMethods> get shippingMethods => _shippingMethods;
  set shippingMethods(List<ShippingMethods> value) =>
      _shippingMethods.value = value;
  //radio shipping expenses
  RxInt _shippingExpenses = 0.obs;
  int get shippingExpenses => _shippingExpenses.value;
  set shippingExpenses(int value) => _shippingExpenses.value = value;
  //shipping list
  RxList<Shipping> _shippingList = <Shipping>[].obs;
  List<Shipping> get shippingList => _shippingList;
  set shippingList(List<Shipping> value) => _shippingList.value = value;

  //next step
  void nextStep() {
    if (currentStep < steps.length - 1) {
      currentStep++;
      scrollController.scrollToIndex(currentStep);
    }
  }

  // previous step
  void previousStep() {
    if (currentStep > 0) {
      currentStep--;
    }
  }

  //change check shipping methods
  void changeCheckShippingMethods(int index, bool value) {
    shippingMethods[index].checked = value;
    _shippingMethods.refresh();
  }

  //add to shipping list
  void addToShippingList() {
    //validate
    if (shippingCompanyProductController.text.isNotEmpty &&
        shippingPriceProductController.text.isNotEmpty) {
      shippingList.add(Shipping(
          company: shippingCompanyProductController.text,
          price: shippingPriceProductController.text));
      _shippingList.refresh();
      //clear textfields
      shippingCompanyProductController.clear();
      shippingPriceProductController.clear();
    } else {
      Get.snackbar('Error', 'Debes llenar todos los campos',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  //delete from shipping list
  void deleteFromShippingList(int index) {
    shippingList.removeAt(index);
    _shippingList.refresh();
  }
}
