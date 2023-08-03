// ignore_for_file: prefer_final_fields

import 'package:get_storage/get_storage.dart';
import 'package:indiabana_app/app/data/models/response/users_profile_response.dart';
import 'package:indiabana_app/app/data/repository/user_repository.dart';
import 'package:indiabana_app/app/data/storage/cache_manager.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/di/service_locator.dart';
import 'package:indiabana_app/app/shared/configs/logger_service.dart';

class AuthenticationManager extends GetxService with CacheManager {
  final usersRepository = getIt.get<UsersRepository>();

  RxString _token = ''.obs;
  //getters and setters
  String? get token => _token.value;
  set token(String? value) => _token.value = value!;
  Rx<Profile> _profileUser = Profile().obs;
  //getters and setters
  Profile? get profileUser => _profileUser.value;
  set profileUser(Profile? value) => _profileUser.value = value!;
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
    //user profile delete
    profileUser = Profile();
    removeToken();
  }

  void getUser() {
    token = getToken() ?? '';

    //check token exist
    if (token != '') {
      //get profile
      getProfile();
    }

    LoggerService().infoLog((token).toString());
  }

  //get profile

  void getProfile() async {
    try {
      final response = await usersRepository.getProfile();
      profileUser = response.data?.data;
    } catch (e) {
      LoggerService().errorLog(e.toString());
    }
  }
}
