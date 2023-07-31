import 'package:dio/dio.dart';
import 'package:indiabana_app/app/data/models/response/categories_response.dart';
import 'package:indiabana_app/app/data/network/api/categories_api.dart';
import 'package:indiabana_app/app/data/network/dio_exceptions.dart';

class CategoriesRepository {
  final CategoriesApi categoriesApi;

  CategoriesRepository(this.categoriesApi);

  Future<List<Category>> getCategories() async {
    try {
      final response = await categoriesApi.getCategories();
      final categories = (response.data['data']['categories'] as List)
          .map((e) => Category.fromJson(e))
          .toList();
      return categories;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  // Future<NewUser> addNewUserRequested(String name, String job) async {
  //   try {
  //     final response = await userApi.addUserApi(name, job);
  //     return NewUser.fromJson(response.data);
  //   } on DioError catch (e) {
  //     final errorMessage = DioExceptions.fromDioError(e).toString();
  //     throw errorMessage;
  //   }
  // }

  // Future<NewUser> updateUserRequested(int id, String name, String job) async {
  //   try {
  //     final response = await userApi.updateUserApi(id, name, job);
  //     return NewUser.fromJson(response.data);
  //   } on DioError catch (e) {
  //     final errorMessage = DioExceptions.fromDioError(e).toString();
  //     throw errorMessage;
  //   }
  // }

  // Future<void> deleteNewUserRequested(int id) async {
  //   try {
  //     await userApi.deleteUserApi(id);
  //   } on DioError catch (e) {
  //     final errorMessage = DioExceptions.fromDioError(e).toString();
  //     throw errorMessage;
  //   }
  // }
}
