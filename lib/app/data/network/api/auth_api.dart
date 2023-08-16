import 'package:dio/dio.dart';
import 'package:indiabana_app/app/data/models/request/auth_login_request.dart';
import 'package:indiabana_app/app/data/models/request/auth_register_request.dart';
import 'package:indiabana_app/app/data/network/dio_client.dart';

class AuthApi {
  final DioClient dioClient;

  AuthApi({required this.dioClient});

  Future<Response> login(LoginRequest req) async {
    try {
      final Response response =
          await dioClient.post('/login', data: req.toJson());
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //register
  Future<Response> signUp(RegisterRequest req) async {
    try {
      final Response response =
          await dioClient.post('/register', data: req.toJson());
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //logout
}
