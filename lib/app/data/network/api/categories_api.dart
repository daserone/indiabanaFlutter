import 'package:dio/dio.dart';
import 'package:indiabana_app/app/data/network/api/constants/endpoints.dart';
import 'package:indiabana_app/app/data/network/dio_client.dart';

class CategoriesApi {
  final DioClient dioClient;

  CategoriesApi({required this.dioClient});

  Future<Response> getCategories() async {
    try {
      final Response response = await dioClient.get(Endpoints.categories);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
