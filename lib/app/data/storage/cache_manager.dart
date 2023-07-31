import 'package:get_storage/get_storage.dart';
import 'package:indiabana_app/app/shared/configs/logger_service.dart';
import 'package:indiabana_app/app/shared/constants/constants.dart';

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    LoggerService().infoLog('SAVING');
    await box.write(AppConstants.TOKEN_KEY, token);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(AppConstants.TOKEN_KEY);
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(AppConstants.TOKEN_KEY);
  }
}
