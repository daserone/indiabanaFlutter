import 'package:dio/dio.dart';
import 'package:indiabana_app/app/data/network/dio_client.dart';
import 'package:indiabana_app/app/shared/configs/logger_service.dart';

class ProductsApi {
  final DioClient dioClient;

  ProductsApi({required this.dioClient});

  Future<Response> getProductsByCategory(String catId) async {
    try {
      final Response response = await dioClient
          .get('/products_by_category?limit=0&category_id=$catId');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //product by id
  Future<Response> getProductById(String id) async {
    try {
      final Response response = await dioClient.get('/get-stock?id=$id');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //related products
  Future<Response> getRelatedProducts(String id) async {
    try {
      final Response response = await dioClient.get('/related_products?id=$id');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // add question to product
  Future<Response> addQuestionToProduct(FormData form) async {
    try {
      final Response response = await dioClient.post(
        '/product/create-question',
        data: form,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //create product
  Future<Response> createProduct(FormData form) async {
    try {
      final Response response = await dioClient.post(
        '/create-product',
        data: form,
      );
      LoggerService().infoLog(response.toString());
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //create variant
  Future<Response> createVariant(FormData form) async {
    try {
      final Response response = await dioClient.post(
        '/variation',
        data: form,
      );
      LoggerService().infoLog(response.toString());
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //create publication
  Future<Response> createPublication(FormData form) async {
    try {
      final Response response = await dioClient.post(
        '/publishment',
        data: form,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
