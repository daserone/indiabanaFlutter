import 'package:get/get.dart';

class LoginController extends GetxController {
  // login or register
  RxBool _isLogin = true.obs;
  bool get isLogin => _isLogin.value;
  set isLogin(bool value) => _isLogin.value = value;

  // change login
  void changeLogin() {
    isLogin = !isLogin;
  }
}
