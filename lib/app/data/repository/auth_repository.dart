import 'package:dio/dio.dart';
import 'package:indiabana_app/app/data/models/request/auth_login_request.dart';
import 'package:indiabana_app/app/data/models/response/auth_login_response.dart';
import 'package:indiabana_app/app/data/network/api/auth_api.dart';
import 'package:indiabana_app/app/data/network/dio_exceptions.dart';

class AuthRepository {
  final AuthApi authApi;

  AuthRepository(this.authApi);

  Future<LoginResponse> login(LoginRequest req) async {
    try {
      final response = await authApi.login(req);
      final resp = LoginResponse.fromJson(response.data);
      return resp;
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
