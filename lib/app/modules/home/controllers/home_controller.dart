// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/data/models/response/categories_response.dart';
import 'package:indiabana_app/app/data/models/response/products_cat_response.dart';
import 'package:indiabana_app/app/data/repository/categories_repository.dart';
import 'package:indiabana_app/app/data/repository/common_repository.dart';
import 'package:indiabana_app/app/data/repository/products_repository.dart';
import 'package:indiabana_app/app/data/repository/user_repository.dart';
import 'package:indiabana_app/app/data/storage/storage_service.dart';
import 'package:indiabana_app/app/di/service_locator.dart';
import 'package:indiabana_app/app/shared/configs/logger_service.dart';

class HomeController extends GetxController {
  final categoriesRepository = getIt.get<CategoriesRepository>();
  final commonRepository = getIt.get<CommonRepository>();
  final productsRepository = getIt.get<ProductsRepository>();
  final usersRepository = getIt.get<UsersRepository>();

  final cacheController = Get.find<AuthenticationManager>();

  //pageview
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  RxInt _currentPage = 0.obs;
  //get and set
  int get currentPage => _currentPage.value;
  set currentPage(int value) => _currentPage.value = value;

  //banners
  RxList<String> _banners = <String>[].obs;
  //get and set
  List<String> get banners => _banners;
  set banners(List<String> value) => _banners.value = value;
  //categories
  RxList<Category> _categories = <Category>[].obs;
  //get and set
  List<Category> get categories => _categories;
  set categories(List<Category> value) => _categories.value = value;

  //selected category
  Rx<Category> _selectedCategory = Category().obs;
  //get and set
  Category get selectedCategory => _selectedCategory.value;
  set selectedCategory(Category value) => _selectedCategory.value = value;

  //products
  RxList<ProductElement> _products = <ProductElement>[].obs;
  //get and set
  List<ProductElement> get products => _products;
  set products(List<ProductElement> value) => _products.value = value;

  //loading products
  RxBool _loadingProducts = false.obs;
  //get and set
  bool get loadingProducts => _loadingProducts.value;
  set loadingProducts(bool value) => _loadingProducts.value = value;

  @override
  void onInit() {
    getCategories();
    getBanners();
    //check if token exist
    // if (cacheController.token != '') {
    //   getProfile();
    // }
    super.onInit();
  }
  //page events

  void pageChanged(int index) {
    currentPage = index;
  }

  void bottomTapped(int index) {
    currentPage = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  void getCategories() async {
    try {
      final response = await categoriesRepository.getCategories();

      categories = response;
      selectedCategory = response[0];
      if (response[0].id != '' || response[0].id != null) {
        getProductsByCategory(response[0].id!);
      }
    } catch (e) {
      categories = [];
    }
  }

  //get products by category

  void getProductsByCategory(String catId) async {
    try {
      loadingProducts = true;
      final response = await productsRepository.getProductsByCategory(catId);
      products = response.data?.products ?? [];
      loadingProducts = false;
    } catch (e) {
      loadingProducts = false;
      products = [];
      //logger
      LoggerService().errorLog(e.toString());
    }
  }

  void getBanners() async {
    try {
      final response = await commonRepository.getBanners();

      banners = response.data?.files ?? [];
      // LoggerService().infoLog(banners.toString());
    } catch (e) {
      //logger
      LoggerService().errorLog(e.toString());
      banners = [];
    }
  }

  //select only one category
  void selectCategory(Category category) {
    selectedCategory = category;
    getProductsByCategory(category.id!);
  }

  //get profile

  void getProfile() async {
    try {
      final response = await usersRepository.getProfile();
      LoggerService().infoLog(response.data.toString());
    } catch (e) {
      LoggerService().errorLog(e.toString());
    }
  }
}
