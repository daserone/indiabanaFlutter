// ignore_for_file: prefer_final_fields

import 'package:get_storage/get_storage.dart';
import 'package:indiabana_app/app/data/storage/cache_manager.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/shared/configs/logger_service.dart';

class AuthenticationManager extends GetxService with CacheManager {
  RxString _token = ''.obs;
  //getters and setters
  String? get token => _token.value;
  set token(String? value) => _token.value = value!;

  @override
  void onInit() {
    initGetStorage();
    getUser();
    super.onInit();
  }

  void initGetStorage() async {
    await GetStorage.init();
  }

  void saveUser(String tokenString) {
    saveToken(tokenString);
    token = tokenString;
  }

  void deleteUser() {
    token = '';
    removeToken();
  }

  void getUser() {
    token = getToken() ?? '';
    LoggerService().infoLog((token == '').toString());
  }
}
