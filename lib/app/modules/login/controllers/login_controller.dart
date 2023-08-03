import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/data/models/request/auth_login_request.dart';
import 'package:indiabana_app/app/data/repository/auth_repository.dart';
import 'package:indiabana_app/app/data/storage/storage_service.dart';
import 'package:indiabana_app/app/di/service_locator.dart';
import 'package:indiabana_app/app/shared/configs/logger_service.dart';

class LoginController extends GetxController {
  //repository
  final AuthRepository _authRepository = getIt.get<AuthRepository>();
  // login or register
  RxBool _isLogin = true.obs;
  bool get isLogin => _isLogin.value;
  set isLogin(bool value) => _isLogin.value = value;
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  // controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  //password show
  RxBool _passwordShow = false.obs;
  bool get passwordShow => _passwordShow.value;
  set passwordShow(bool value) => _passwordShow.value = value;

  // change login
  void changeLogin() {
    isLogin = !isLogin;
  }

  //show password
  void showPassword() {
    passwordShow = !passwordShow;
  }

  //login
  void login() async {
    if (formKey.currentState!.validate()) {
      try {
        LoginRequest req = LoginRequest(
          email: emailController.text,
          password: passwordController.text,
        );
        final resp = await _authRepository.login(req);
        LoggerService().infoLog(resp.type!);
        if (resp.type == 'error') {
          Get.snackbar(
            'Error',
            resp.message?.translation ?? '',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
          return;
        }
        Get.snackbar(
          'Éxito',
          resp.message?.translation ?? '',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
        final controller = Get.find<AuthenticationManager>();
        controller.saveUser(resp.data!.token!);
        controller.getProfile();
        Get.offNamed('/home');
      } catch (e) {
        LoggerService().errorLog(e.toString());
      }
    }
  }
}
