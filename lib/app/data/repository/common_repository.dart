import 'package:dio/dio.dart';
import 'package:indiabana_app/app/data/models/response/common_banners_response.dart';
import 'package:indiabana_app/app/data/network/api/common_api.dart';
import 'package:indiabana_app/app/data/network/dio_exceptions.dart';
// import 'package:indiabana_app/app/shared/configs/logger_service.dart';

class CommonRepository {
  final CommonApi commonApi;

  CommonRepository(this.commonApi);

  Future<BannersResponse> getBanners() async {
    try {
      final response = await commonApi.getBanners();
      // LoggerService().infoLog(response.toString());
      final banners =
          BannersResponse.fromJson(response.data as Map<String, dynamic>);
      return banners;
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
