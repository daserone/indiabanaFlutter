import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/data/models/response/products_all_response.dart';
import 'package:indiabana_app/app/data/models/response/products_cat_response.dart';
import 'package:indiabana_app/app/data/repository/products_repository.dart';
import 'package:indiabana_app/app/di/service_locator.dart';
import 'package:indiabana_app/app/shared/configs/logger_service.dart';

class ProductsController extends GetxController {
  final productsRepository = getIt.get<ProductsRepository>();
  late ScrollController scrollController;

  //search controller
  final searchController = TextEditingController();

  //list products
  final RxList<Doc> _products = <Doc>[].obs;
  List<Doc> get products => _products;
  set products(List<Doc> value) => _products.assignAll(value);

  //list products by category
  final RxList<ProductElement> _productsByCategory = <ProductElement>[].obs;
  List<ProductElement> get productsByCategory => _productsByCategory;
  set productsByCategory(List<ProductElement> value) =>
      _productsByCategory.assignAll(value);

  //current page
  final RxInt _currentPage = 1.obs;
  int get currentPage => _currentPage.value;
  set currentPage(int value) => _currentPage.value = value;

  final RxBool _hasNextPage = true.obs;
  bool get hasNextPage => _hasNextPage.value;
  set hasNextPage(bool value) => _hasNextPage.value = value;

  final RxBool _isFirstLoadRunning = false.obs;
  bool get isFirstLoadRunning => _isFirstLoadRunning.value;
  set isFirstLoadRunning(bool value) => _isFirstLoadRunning.value = value;

  final RxBool _isLoadMoreRunning = false.obs;
  bool get isLoadMoreRunning => _isLoadMoreRunning.value;
  set isLoadMoreRunning(bool value) => _isLoadMoreRunning.value = value;
  Timer? timer;

  //selected category
  final RxString _selectedCategory = ''.obs;
  String get selectedCategory => _selectedCategory.value;
  set selectedCategory(String value) => _selectedCategory.value = value;

  @override
  void onInit() {
    firstLoad();
    scrollController = ScrollController()
      ..addListener(() {
        loadMore();
      });
    super.onInit();
  }

  //get products
  Future<void> firstLoad() async {
    try {
      isFirstLoadRunning = true;

      final response = await productsRepository.getAllProducts(
          page: currentPage, limit: 10, searchTerm: searchController.text);
      LoggerService().infoLog(response.type.toString());
      if (response.type == 'success') {
        products = response.data?.docs ?? [];
        hasNextPage = response.data?.hasNextPage ?? false;
        isFirstLoadRunning = false;

        LoggerService().infoLog(products.length.toString());
      }
    } catch (e) {
      LoggerService().errorLog(e.toString());
    }
  }

  //cargar mas
  Future<void> loadMore() async {
    try {
      if (hasNextPage == true &&
          isFirstLoadRunning == false &&
          isLoadMoreRunning == false &&
          scrollController.position.pixels >
              scrollController.position.maxScrollExtent - 200) {
        isLoadMoreRunning = true;

        currentPage += 1;

        final response = await productsRepository.getAllProducts(
            page: currentPage, limit: 10, searchTerm: searchController.text);
        if (response.type == 'success') {
          products.addAll(response.data?.docs ?? []);
          isLoadMoreRunning = false;

          hasNextPage = response.data?.hasNextPage ?? false;
        }
      }
    } catch (e) {
      LoggerService().errorLog(e.toString());
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  //refresh
  Future<void> refreshData() async {
    try {
      isFirstLoadRunning = true;
      currentPage = 1;
      searchController.clear();
      selectedCategory = '';
      productsByCategory = [];
      hasNextPage = true;
      final response = await productsRepository.getAllProducts(
          page: currentPage, limit: 10, searchTerm: searchController.text);
      if (response.type == 'success') {
        products = response.data?.docs ?? [];
        hasNextPage = response.data?.hasNextPage ?? false;
        isFirstLoadRunning = false;
      }
    } catch (e) {
      LoggerService().errorLog(e.toString());
    }
  }

  //search
  Future<void> searchProducts() async {
    try {
      selectedCategory = '';
      isFirstLoadRunning = true;
      currentPage = 1;
      hasNextPage = true;
      final response = await productsRepository.getAllProducts(
          page: currentPage, limit: 10, searchTerm: searchController.text);
      if (response.type == 'success') {
        products = response.data?.docs ?? [];
        hasNextPage = response.data?.hasNextPage ?? false;
        isFirstLoadRunning = false;
      }
    } catch (e) {
      LoggerService().errorLog(e.toString());
    }
  }

  void getProductsByCategory(String catId) async {
    try {
      isFirstLoadRunning = true;
      currentPage = 1;
      hasNextPage = true;
      final response = await productsRepository.getProductsByCategory(catId);
      productsByCategory = response.data?.products ?? [];
      isFirstLoadRunning = false;
    } catch (e) {
      productsByCategory = [];
      //logger
      LoggerService().errorLog(e.toString());
    }
  }
}
