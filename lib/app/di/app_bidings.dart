import 'package:get/get.dart';
import 'package:indiabana_app/app/data/storage/storage_service.dart';
import 'package:indiabana_app/app/shared/configs/logger_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationManager());
    //logger
    Get.put(LoggerService());
  }
}
