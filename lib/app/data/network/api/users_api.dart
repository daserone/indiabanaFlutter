import 'package:dio/dio.dart';
import 'package:indiabana_app/app/data/network/dio_client.dart';

class UsersApi {
  final DioClient dioClient;

  UsersApi({required this.dioClient});

  Future<Response> getProfile() async {
    try {
      final Response response = await dioClient.get(
        '/profile',
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
