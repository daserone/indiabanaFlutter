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
        height: controller.isLogin ? Get.height / 2.5 : Get.height / 2.3,
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
          child: Form(
            key: controller.formKey,
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
                        controller: controller.nameController,
                        decoration: const InputDecoration(
                          hintText: 'Nombre',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su nombre';
                          }
                          return null;
                        }),
                TextFormField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                      hintText: 'Correo electrónico',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese su correo electrónico';
                      }
                      return null;
                    }),
                TextFormField(
                  controller: controller.passwordController,
                  obscureText: !controller.passwordShow,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    suffixIcon: IconButton(
                      onPressed: controller.showPassword,
                      icon: controller.passwordShow
                          ? const Icon(Icons.visibility)
                          : const Icon(
                              Icons.visibility_off,
                            ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese su contraseña';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                !controller.isLogin
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Olvide contraseña',
                            style: TextStyle(
                                color: ColorConstants.indiabanaOrange),
                          ),
                        ],
                      ),
                // política de privacidad
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
                    onPressed: controller.login,
                    child: Text(
                      controller.isLogin ? 'Ingresar' : 'Registrarse',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
