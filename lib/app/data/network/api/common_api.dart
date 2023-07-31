import 'package:dio/dio.dart';
import 'package:indiabana_app/app/data/network/api/constants/endpoints.dart';
import 'package:indiabana_app/app/data/network/dio_client.dart';

class CommonApi {
  final DioClient dioClient;

  CommonApi({required this.dioClient});

  Future<Response> getBanners() async {
    try {
      final Response response = await dioClient.get(Endpoints.banners);
      return response;
    } catch (e) {
      rethrow;
    }
  }

// Future<Response> updateUserApi(int id, String name, String job) async {
//   try {
//     final Response response = await dioClient.put(
//       Endpoints.users + '/$id',
//       data: {
//         'name': name,
//         'job': job,
//       },
//     );
//     return response;
//   } catch (e) {
//     rethrow;
//   }
// }

// Future<void> deleteUserApi(int id) async {
//   try {
//     await dioClient.delete(Endpoints.users + '/$id');
//   } catch (e) {
//     rethrow;
//   }
// }
}
