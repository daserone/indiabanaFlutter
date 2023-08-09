import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indiabana_app/app/data/models/pub_type.dart';
import 'package:indiabana_app/app/data/models/shipping_list.dart';
import 'package:indiabana_app/app/data/models/shipping_method.dart';
import 'package:indiabana_app/app/shared/utils/image_picker.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class NewProductController extends GetxController {
  //stepper index
  final RxInt _currentStep = 0.obs;
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
  TextEditingController codeProductController = TextEditingController();
  //ficha técnica
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
  //shipping
  TextEditingController shippingPriceProductController =
      TextEditingController();
  //price
  TextEditingController priceProductController = TextEditingController();
  //inventory
  TextEditingController inventoryProductController = TextEditingController();
  //sku
  TextEditingController skuProductController = TextEditingController();
  //discount
  TextEditingController discountProductController = TextEditingController();
  //discount from to
  TextEditingController discountFromProductController = TextEditingController();
  TextEditingController discountToProductController = TextEditingController();

  //discount radio
  final RxInt _discountRadio = 0.obs;
  int get discountRadio => _discountRadio.value;
  set discountRadio(int value) => _discountRadio.value = value;

  //radio product condition
  final RxInt _productCondition = 0.obs;
  int get productCondition => _productCondition.value;
  set productCondition(int value) => _productCondition.value = value;
  //radio product warranty
  final RxInt _productWarranty = 0.obs;
  int get productWarranty => _productWarranty.value;
  set productWarranty(int value) => _productWarranty.value = value;

  //image picker files empty
  final RxList<XFile> _multipleImages = <XFile>[
    XFile(''),
    XFile(''),
    XFile(''),
    XFile(''),
  ].obs;
  List<XFile> get multipleImages => _multipleImages;
  set multipleImages(List<XFile> value) => _multipleImages.value = value;

  //list shipping methods
  final RxList<ShippingMethods> _shippingMethods = <ShippingMethods>[
    ShippingMethods(method: 'ICarry', checked: false),
    ShippingMethods(method: 'Retiro en tienda', checked: false),
    ShippingMethods(method: 'Otros', checked: false),
  ].obs;
  List<ShippingMethods> get shippingMethods => _shippingMethods;
  set shippingMethods(List<ShippingMethods> value) =>
      _shippingMethods.value = value;
  //radio shipping expenses
  final RxInt _shippingExpenses = 0.obs;
  int get shippingExpenses => _shippingExpenses.value;
  set shippingExpenses(int value) => _shippingExpenses.value = value;
  //shipping list
  final RxList<Shipping> _shippingList = <Shipping>[].obs;
  List<Shipping> get shippingList => _shippingList;
  set shippingList(List<Shipping> value) => _shippingList.value = value;

  // pub type list NewProductPubTypes
  final RxList<NewProductPubTypes> _pubTypeList = <NewProductPubTypes>[
    NewProductPubTypes(
        type: 'assets/images/gratuita.png',
        duration: '60 días',
        exposure: 'Baja exposición',
        sales: 'No acumula ventas ni visualización',
        stock: 'Stock limitado(1 unidad)',
        commissions: 'Sin comisiones por venta'),
    NewProductPubTypes(
        type: 'assets/images/estandar.png',
        duration: '60 días',
        exposure: 'Alta exposición',
        sales: 'Acumula ventas y visualización',
        stock: 'Stock ilimitado',
        commissions: 'Comisión por venta 5%'),
    NewProductPubTypes(
        type: 'assets/images/gold.png',
        duration: '60 días',
        exposure: 'Alta exposición',
        sales: 'Acumula ventas y visualización',
        stock: 'Stock ilimitado',
        commissions: 'Comisión por venta 5%'),
    NewProductPubTypes(
        type: 'assets/images/destacado.png',
        duration: '60 días',
        exposure: 'Alta exposición',
        sales: 'Acumula ventas y visualización',
        stock: 'Stock ilimitado',
        commissions: 'Comisión por venta 5%')
  ].obs;
  List<NewProductPubTypes> get pubTypeList => _pubTypeList;
  set pubTypeList(List<NewProductPubTypes> value) => _pubTypeList.value = value;
  //selected
  final RxInt _selectedPubType = 0.obs;
  int get selectedPubType => _selectedPubType.value;
  set selectedPubType(int value) => _selectedPubType.value = value;

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

  //change step
  void changeStep(int index) {
    currentStep = index;
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

  //void get image from camera
  void getImageFromCamera(int index) async {
    final image = await pickerImageCamera();
    if (image != null) {
      multipleImages[index] = image;
      _multipleImages.refresh();
    }
  }
  //get image from gallery

  void getImageFromGallery(int index) async {
    final image = await pickerImageGallery();
    if (image != null) {
      //at specific index
      multipleImages[index] = image;

      _multipleImages.refresh();
    }
  }

  //delete image
  void deleteImage(int index) {
    multipleImages[index] = XFile('');
    _multipleImages.refresh();
  }

  //change selected
  void changeSelected(int index) {
    selectedPubType = index;
  }
}
