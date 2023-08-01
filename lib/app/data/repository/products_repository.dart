import 'package:dio/dio.dart';
import 'package:indiabana_app/app/data/models/response/products_cat_response.dart';
import 'package:indiabana_app/app/data/network/api/products_api.dart';
import 'package:indiabana_app/app/data/network/dio_exceptions.dart';
// import 'package:indiabana_app/app/shared/configs/logger_service.dart';

class ProductsRepository {
  final ProductsApi productsApi;

  ProductsRepository(this.productsApi);

  Future<ProductsByCatResponse> getProductsByCategory(String catId) async {
    try {
      final response = await productsApi.getProductsByCategory(catId);
      // LoggerService().infoLog(response.toString());
      final banners =
          ProductsByCatResponse.fromJson(response.data as Map<String, dynamic>);
      return banners;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
