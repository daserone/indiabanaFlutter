// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';
import 'package:indiabana_app/app/data/models/response/categories_response.dart';
import 'package:indiabana_app/app/data/repository/categories_repository.dart';
import 'package:indiabana_app/app/data/repository/common_repository.dart';
import 'package:indiabana_app/app/di/service_locator.dart';
import 'package:indiabana_app/app/shared/configs/logger_service.dart';

class HomeController extends GetxController {
  final categoriesRepository = getIt.get<CategoriesRepository>();
  final commonRepository = getIt.get<CommonRepository>();

  RxList<Category> _categories = <Category>[].obs;
  //get and set
  List<Category> get categories => _categories;
  set categories(List<Category> value) => _categories.value = value;
  @override
  void onInit() {
    getCategories();
    getBanners();
    super.onInit();
  }

  void getCategories() async {
    try {
      final response = await categoriesRepository.getCategories();

      categories = response;
    } catch (e) {
      categories = [];
    }
  }

  //banners
  RxList<String> _banners = <String>[].obs;
  //get and set
  List<String> get banners => _banners;
  set banners(List<String> value) => _banners.value = value;

  void getBanners() async {
    try {
      final response = await commonRepository.getBanners();

      banners = response.data?.files ?? [];
      LoggerService().infoLog(banners.toString());
    } catch (e) {
      //logger
      LoggerService().errorLog(e.toString());
      banners = [];
    }
  }
}
