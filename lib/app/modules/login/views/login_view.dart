import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/login/views/widgets/form.dart';
import 'package:indiabana_app/app/modules/login/views/widgets/form_header.dart';
import 'package:indiabana_app/app/shared/constants/constants.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.indiabanaDarkBlue,
      appBar: AppBar(),
      body: ListView(
        children: [
          const Stack(
            children: [FormHeader(), FormLogin()],
          ),
          SizedBox(height: Get.height / 8),
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.isLogin
                        ? '¿No tienes cuenta?'
                        : '¿Ya tienes cuenta?',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      controller.changeLogin();
                    },
                    child: Text(
                      controller.isLogin ? 'Regístrate' : 'Inicia Sesión',
                      style: TextStyle(
                          color: ColorConstants.indiabanaOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
