import 'package:get/state_manager.dart';
import 'package:logger/logger.dart';

class LoggerService extends GetxService {
  var logger = Logger(
    filter: null,
    printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        printTime: false),
    output: null,
  );

  void infoLog(String message) {
    logger.i(message);
  }

  //error log
  void errorLog(String message) {
    logger.e(message);
  }

  //warning log
  void warningLog(String message) {
    logger.w(message);
  }

  //fatal log
  void fatalLog(String message, StackTrace trace) {
    logger.f(message, stackTrace: trace);
  }
}
