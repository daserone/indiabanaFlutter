import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indiabana_app/app/data/models/pub_type.dart';
import 'package:indiabana_app/app/data/models/shipping_list.dart';
import 'package:indiabana_app/app/data/models/shipping_method.dart';
import 'package:indiabana_app/app/data/models/variant_model.dart';
import 'package:indiabana_app/app/data/repository/products_repository.dart';
import 'package:indiabana_app/app/data/storage/storage_service.dart';
import 'package:indiabana_app/app/di/service_locator.dart';
import 'package:indiabana_app/app/routes/app_pages.dart';
import 'package:indiabana_app/app/shared/configs/logger_service.dart';
import 'package:indiabana_app/app/shared/utils/image_picker.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class NewProductController extends GetxController {
  final productsRepository = getIt.get<ProductsRepository>();

  final AuthenticationManager _authController =
      Get.find<AuthenticationManager>();
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
    'Ficha técnica',
    'Condición',
    'Envíos',
    'Datos y Galería',
    'Precio e Inventario',
    'Publicar'
  ];
  //form key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //variant form key
  GlobalKey<FormState> variantFormKey = GlobalKey<FormState>();
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
  //description
  TextEditingController descriptionProductController = TextEditingController();
  //variant
  TextEditingController variantProductController = TextEditingController();
  //variant value
  TextEditingController variantValueProductController = TextEditingController();
  //variant price
  TextEditingController variantPriceProductController = TextEditingController();
  //variant inventory
  TextEditingController variantInventoryProductController =
      TextEditingController();
  //variant sku
  TextEditingController variantSkuProductController = TextEditingController();
  //variant discount
  TextEditingController variantDiscountProductController =
      TextEditingController();
  //variant discount from to
  TextEditingController variantDiscountFromProductController =
      TextEditingController();
  TextEditingController variantDiscountToProductController =
      TextEditingController();

  //variant discount radio
  final RxInt _variantDiscountRadio = 0.obs;
  int get variantDiscountRadio => _variantDiscountRadio.value;
  set variantDiscountRadio(int value) => _variantDiscountRadio.value = value;
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
  final RxList<XFile> _productImages = <XFile>[
    XFile(''),
    XFile(''),
    XFile(''),
    XFile(''),
  ].obs;
  List<XFile> get productImages => _productImages;
  set productImages(List<XFile> value) => _productImages.value = value;
  //variant image
  final Rx<XFile> _variantImage = XFile('').obs;
  XFile get variantImage => _variantImage.value;
  set variantImage(XFile value) => _variantImage.value = value;
  //images error
  final RxBool _imagesError = false.obs;
  bool get imagesError => _imagesError.value;
  set imagesError(bool value) => _imagesError.value = value;
  //list shipping methods
  final RxList<ShippingMethods> _shippingMethods = <ShippingMethods>[
    ShippingMethods(method: 'ICarry', checked: false),
    ShippingMethods(method: 'Recolección en tienda', checked: false),
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
  //shipping error
  final RxBool _shippingError = false.obs;
  bool get shippingError => _shippingError.value;
  set shippingError(bool value) => _shippingError.value = value;
  //shipping list error
  final RxBool _shippingListError = false.obs;
  bool get shippingListError => _shippingListError.value;
  set shippingListError(bool value) => _shippingListError.value = value;

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

  final RxInt _selectedPubType = 0.obs;
  int get selectedPubType => _selectedPubType.value;
  set selectedPubType(int value) => _selectedPubType.value = value;

  //variant form data list
  final RxList<VariantModel> _variantFormDataList = <VariantModel>[].obs;
  List<VariantModel> get variantFormDataList => _variantFormDataList;
  set variantFormDataList(List<VariantModel> value) =>
      _variantFormDataList.value = value;

  void nextStep() {
    if (currentStep < steps.length - 1) {
      currentStep++;
      scrollController.scrollToIndex(currentStep);
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      currentStep--;
    }
  }

  void changeStep(int index) {
    currentStep = index;
  }

  void changeCheckShippingMethods(int index, bool value) {
    shippingMethods[index].checked = value;
    _shippingMethods.refresh();
  }

  void addToShippingList() {
    if (shippingCompanyProductController.text.isNotEmpty &&
        shippingPriceProductController.text.isNotEmpty) {
      shippingList.add(Shipping(
          company: shippingCompanyProductController.text,
          price: shippingPriceProductController.text));
      _shippingList.refresh();
      shippingCompanyProductController.clear();
      shippingPriceProductController.clear();
    } else {
      Get.snackbar('Error', 'Debes llenar todos los campos',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void deleteFromShippingList(int index) {
    shippingList.removeAt(index);
    _shippingList.refresh();
  }

  void getImageFromCamera(int index, bool isVariant) async {
    final image = await pickerImageCamera();
    if (image != null) {
      if (isVariant) {
        variantImage = image;
      } else {
        productImages[index] = image;
        _productImages.refresh();
      }
    }
  }

  void getImageFromGallery(int index, bool isVariant) async {
    final image = await pickerImageGallery();
    if (image != null) {
      if (isVariant) {
        variantImage = image;
      } else {
        productImages[index] = image;

        _productImages.refresh();
      }
    }
  }

  void deleteImage(int index) {
    productImages[index] = XFile('');
    _productImages.refresh();
  }

  void deleteImageVariant() {
    variantImage = XFile('');
  }

  void changeSelected(int index) {
    selectedPubType = index;
  }

  Future<void> publishProduct() async {
    try {
      final form = await createFormProduct();
      final response = await productsRepository.createProduct(form);

      //create pub
      LoggerService().infoLog('PUBLISH 0 ${response.type}');

      if (response.type == 'success') {
        LoggerService().infoLog('PUBLISH 0 ${response.data!.product!.id!}');

        await createPublication(response.data!.stock!.id!);
      }
    } catch (e) {
      LoggerService().errorLog(e.toString());
    }
  }

  Future<void> createPublication(String stockId) async {
    LoggerService().infoLog('PUBLISH 1');

    try {
      final form = await crateFormPublication(stockId);

      final response = await productsRepository.createPublication(form);

      if (response.type == 'success') {
        Get.offAllNamed(Routes.HOME);
      }
    } catch (e) {
      LoggerService().errorLog(e.toString());
    }
  }

  //create form publication
  Future<dio.FormData> crateFormPublication(String stockId) async {
    final formData = dio.FormData.fromMap({
      'seller_id': _authController.profileUser?.sellerId,
      'stock': stockId,
      'plan': selectedPubType,
      'images': await getMultipartsFiles()
    });
    return formData;
  }

  Future<dio.FormData> createFormProduct() async {
    final formData = dio.FormData.fromMap({
      'name': nameProductController.text,
      'price': priceProductController.text,
      'brand': brandProductController.text,
      'offer_price': discountProductController.text,
      'category_id': categoryProductController.text,
      'subcategory1_id': '',
      'subcategory2_id': '',
      'seller_id': _authController.profileUser?.sellerId,
      'stock': inventoryProductController.text,
      'description': descriptionProductController.text,
      'model': modelProductController.text,
      'code': codeProductController.text,
      'weight': weightProductController.text,
      'height': heightProductController.text,
      'width': widthProductController.text,
      'length': lengthProductController.text,
      'condition': productCondition == 0
          ? 'nuevo'
          : productCondition == 1
              ? 'usado'
              : 'reacondicionado',
      'datasheet': '',
      'warranty': productWarranty == 0
          ? 'por el vendedor'
          : productWarranty == 1
              ? 'de fabrica'
              : 'sin garantia',
      'warranty_time': warrantyTimeProductController.text,
      'warranty_time_type': warrantyTypeProductController.text,
      'shipping_method': getStringOfShippingMethods(),
      'shipping_cost_method': shippingExpenses == 0
          ? 'por cuenta del vendedor'
          : 'por cuenta del comprador',
      'on_sale': discountRadio == 1,
      'sku': skuProductController.text,
      'sale_startime': discountFromProductController.text,
      'sale_endtime': discountToProductController.text,
      'main_image_index': 0,
      'images': await getMultipartsFiles()
    });
    return formData;
  }

  Future<dio.FormData> createFormVariant(
    String stockId,
    String variantName,
    String variantValue,
    String variantPrice,
    String variantQuantity,
    bool variantOnSale,
    int variantMainImageIndex,
    XFile variantImg,
    String variantFromDiscount,
    String variantToDiscount,
    String variantDiscount,
  ) async {
    final formData = dio.FormData.fromMap({
      'stock': stockId,
      'name': variantName,
      'value': variantValue,
      'price': variantPrice,
      'quantity': variantQuantity,
      'on_sale': variantOnSale,
      'main_image_index': 0,
      ' sale_startime': variantFromDiscount,
      'sale_endtime': variantToDiscount,
      'offer_price': variantDiscount,
      'images': [await getVariantMultipartFile(variantImg)]
    });
    return formData;
  }

  String getStringOfShippingMethods() {
    String shippingMethodsString = '';
    LoggerService().infoLog(shippingMethods.length.toString());
    //checked methods
    final shippingMethodsChecked =
        shippingMethods.where((element) => element.checked!).toList();

    if (shippingMethodsChecked.length == 1) {
      return shippingMethodsChecked[0].method!.toLowerCase();
    }
    List<String> listOfStr =
        shippingMethodsChecked.map((e) => e.method!).toList();

    shippingMethodsString = listOfStr.join(', ');
    return shippingMethodsString;
  }

  Future<List<dio.MultipartFile>> getMultipartsFiles() async {
    final List<dio.MultipartFile> list = [];
    for (var item in productImages) {
      if (item.path != '') {
        list.add(await dio.MultipartFile.fromFile(item.path));
      }
    }
    LoggerService().infoLog('FILES, $list');

    return list;
  }

  //get variant multipart file
  Future<dio.MultipartFile> getVariantMultipartFile(XFile variantImg) async {
    if (variantImg.path != '') {
      return await dio.MultipartFile.fromFile(variantImg.path);
    }
    return dio.MultipartFile.fromBytes([], filename: '');
  }

  void addVariant() {
    if (variantImage.path == '') {
      Get.snackbar('Error', 'Debes agregar una imagen',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }
    VariantModel variant = VariantModel(
        name: variantProductController.text,
        price: variantPriceProductController.text,
        value: variantValueProductController.text,
        quantity: variantInventoryProductController.text,
        onSale: variantDiscountRadio == 1,
        offerPrice: variantDiscountProductController.text,
        saleStart: variantDiscountFromProductController.text,
        saleEnd: variantDiscountToProductController.text,
        mainImageIndex: 0,
        images: variantImage);
    variantFormDataList.add(variant);
    clearVariantForm();
    Get.back();
  }

  void clearVariantForm() {
    variantProductController.clear();
    variantPriceProductController.clear();
    variantValueProductController.clear();
    variantInventoryProductController.clear();
    variantSkuProductController.clear();
    variantDiscountRadio = 0;
    variantDiscountProductController.clear();
    variantDiscountFromProductController.clear();
    variantDiscountToProductController.clear();
    variantImage = XFile('');
  }

  void removeVariant(int index) {
    variantFormDataList.removeAt(index);
  }
}
