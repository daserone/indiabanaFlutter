import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:indiabana_app/app/data/network/api/categories_api.dart';
import 'package:indiabana_app/app/data/network/api/common_api.dart';
import 'package:indiabana_app/app/data/network/api/products_api.dart';
import 'package:indiabana_app/app/data/network/dio_client.dart';
import 'package:indiabana_app/app/data/repository/categories_repository.dart';
import 'package:indiabana_app/app/data/repository/common_repository.dart';
import 'package:indiabana_app/app/data/repository/products_repository.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  //categories
  getIt.registerSingleton(CategoriesApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(CategoriesRepository(getIt.get<CategoriesApi>()));
  //common
  getIt.registerSingleton(CommonApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(CommonRepository(getIt.get<CommonApi>()));
  //products
  getIt.registerSingleton(ProductsApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(ProductsRepository(getIt.get<ProductsApi>()));
}
