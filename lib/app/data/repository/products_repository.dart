import 'package:dio/dio.dart';
import 'package:indiabana_app/app/data/models/response/product_new_publication_response.dart';
import 'package:indiabana_app/app/data/models/response/product_new_response.dart';
import 'package:indiabana_app/app/data/models/response/products_cat_response.dart';
import 'package:indiabana_app/app/data/models/response/products_related_response.dart';
import 'package:indiabana_app/app/data/models/response/products_stock_response.dart';
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
      final products =
          ProductsByCatResponse.fromJson(response.data as Map<String, dynamic>);
      return products;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  //get product by id
  Future<ProductByIdResponse> getProductById(String id) async {
    try {
      final response = await productsApi.getProductById(id);
      final products =
          ProductByIdResponse.fromJson(response.data as Map<String, dynamic>);

      return products;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  //related products
  Future<SimilarProductsResponse> getRelatedProducts(String id) async {
    try {
      final response = await productsApi.getRelatedProducts(id);
      final products = SimilarProductsResponse.fromJson(
          response.data as Map<String, dynamic>);

      return products;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  // ask question product
  Future<Response> addQuestionToProduct(
      String id, String from, String question) async {
    try {
      FormData form;
      form = FormData.fromMap({
        'id': id,
        'from': from,
        'question': question,
      });
      final response = await productsApi.addQuestionToProduct(form);
      return response;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  //create product
  Future<NewProductResponse> createProduct(FormData form) async {
    try {
      final response = await productsApi.createProduct(form);
      return NewProductResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  //create publication
  Future<NewPublicationResponse> createPublication(FormData form) async {
    try {
      final response = await productsApi.createPublication(form);
      return NewPublicationResponse.fromJson(
          response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
