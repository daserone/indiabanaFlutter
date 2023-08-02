// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/home/views/main_view.dart';
import 'package:indiabana_app/app/modules/login/bindings/login_binding.dart';
import 'package:indiabana_app/app/modules/login/views/login_view.dart';

import '../modules/home/bindings/home_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const MainView(),
      binding: HomeBinding(),
    ),
    //login page
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
