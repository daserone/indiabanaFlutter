import 'package:dio/dio.dart';
import 'package:indiabana_app/app/data/models/response/users_profile_response.dart';
import 'package:indiabana_app/app/data/network/api/users_api.dart';
import 'package:indiabana_app/app/data/network/dio_exceptions.dart';

class UsersRepository {
  final UsersApi usersApi;

  UsersRepository(this.usersApi);

  Future<ProfileResponse> getProfile() async {
    try {
      final response = await usersApi.getProfile();
      final resp = ProfileResponse.fromJson(response.data);
      return resp;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
