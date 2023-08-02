import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/login/controllers/login_controller.dart';
import 'package:indiabana_app/app/shared/constants/constants.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Obx(
      () => Container(
        margin: EdgeInsets.only(top: Get.height / 3.5, left: 20, right: 20),
        height: Get.height / 2.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                controller.isLogin ? 'Inicia Sesión' : 'Regístrate',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              controller.isLogin
                  ? Container()
                  : TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Nombre',
                      ),
                    ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Correo electrónico',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Contraseña',
                ),
              ),
              const SizedBox(height: 20),
              !controller.isLogin
                  ? Container()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Olvide contraseña',
                          style:
                              TextStyle(color: ColorConstants.indiabanaOrange),
                        ),
                      ],
                    ),
              // politica de privacidad
              controller.isLogin
                  ? Container()
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Al registrarte, aceptas nuestras ',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              'Políticas de Privacidad',
                              style: TextStyle(
                                  color: ColorConstants.indiabanaOrange,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'y los ',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              'Términos y Condiciones',
                              style: TextStyle(
                                  color: ColorConstants.indiabanaOrange,
                                  fontSize: 12),
                            ),
                            const Text(
                              '  de Indiabana.',
                              style: TextStyle(fontSize: 12),
                            ),

                            // use text rich instead
                          ],
                        )
                      ],
                    ),

              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: Get.width,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    controller.isLogin ? 'Ingresar' : 'Registrarse',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
