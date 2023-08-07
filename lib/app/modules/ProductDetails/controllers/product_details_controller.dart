import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/data/models/response/products_related_response.dart';
import 'package:indiabana_app/app/data/models/response/products_stock_response.dart';
import 'package:indiabana_app/app/data/repository/products_repository.dart';
import 'package:indiabana_app/app/data/storage/storage_service.dart';
import 'package:indiabana_app/app/di/service_locator.dart';
import 'package:indiabana_app/app/shared/configs/logger_service.dart';

class ProductDetailsController extends GetxController {
  //product repo
  final ProductsRepository _productsRepository =
      getIt.get<ProductsRepository>();
  //auth controller
  final AuthenticationManager _authenticationManager =
      Get.find<AuthenticationManager>();

  //product
  final Rx<DataProduct> _product = DataProduct().obs;
  DataProduct get product => _product.value;
  set product(DataProduct value) => _product.value = value;
  //loading product
  final RxBool _loadingProduct = false.obs;
  bool get loadingProduct => _loadingProduct.value;
  set loadingProduct(bool value) => _loadingProduct.value = value;
  //previos product Id
  final RxString _previousProductId = ''.obs;
  String get previousProductId => _previousProductId.value;
  set previousProductId(String value) => _previousProductId.value = value;

  //related product list
  final RxList<Product> _relatedProducts = <Product>[].obs;
  List<Product> get relatedProducts => _relatedProducts;
  set relatedProducts(List<Product> value) => _relatedProducts.value = value;
  //loading related
  final RxBool _loadingRelated = false.obs;
  bool get loadingRelated => _loadingRelated.value;
  set loadingRelated(bool value) => _loadingRelated.value = value;

  //add product form key
  final GlobalKey<FormState> addProductFormKey = GlobalKey<FormState>();
  //add product text controller
  final TextEditingController addProductTextController =
      TextEditingController();

  @override
  void onInit() {
    LoggerService().infoLog('DETAILS');
    debugPrint(Get.arguments.toString());

    final id = Get.arguments['id'];
    changePreviousProductId(id);
    getProductById(id);

    super.onInit();
  }

  @override
  void onClose() {
    LoggerService().infoLog('CLOSE');

    product = DataProduct();
    super.onClose();
  }
  //get product by Id

  void getProductById(String id) async {
    try {
      loadingProduct = true;
      final resp = await _productsRepository.getProductById(id);
      product = resp.data?.product ?? DataProduct();
      getRelatedProducts();
      log(product.toString());
      loadingProduct = false;
    } catch (e) {
      LoggerService().errorLog(e.toString());
      loadingProduct = false;
      product = DataProduct();
    }
  }

  //get related products
  void getRelatedProducts() async {
    try {
      loadingRelated = true;
      final resp = await _productsRepository
          .getRelatedProducts(product.product?.id ?? '');
      relatedProducts = resp.data?.products ?? [];
      log(relatedProducts.toString());
      loadingRelated = false;
    } catch (e) {
      LoggerService().errorLog(e.toString());
      relatedProducts = [];
      loadingRelated = false;
    }
  }

  //send question
  void sendQuestion() {
    if (addProductFormKey.currentState!.validate()) {
      String userId = _authenticationManager.profileUser?.id ?? '';
      _productsRepository.addQuestionToProduct(
          product.product!.id!, userId, addProductTextController.text);
    }
  }
  // change previous product id

  void changePreviousProductId(String id) {
    previousProductId = id;
  }
}
