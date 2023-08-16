import 'package:dio/dio.dart';
import 'package:indiabana_app/app/data/models/request/auth_login_request.dart';
import 'package:indiabana_app/app/data/models/request/auth_register_request.dart';
import 'package:indiabana_app/app/data/models/response/auth_login_response.dart';
import 'package:indiabana_app/app/data/models/response/auth_register_response.dart';
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

  //register user
  Future<RegisterResponse> signUp(RegisterRequest req) async {
    try {
      final response = await authApi.signUp(req);
      final resp = RegisterResponse.fromJson(response.data);
      return resp;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  //forgot password

  //reset password

  //logout
}
