import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../controllers/initial_controller.dart';

class InitialView extends GetView<InitialController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReactiveForm(
        formGroup: controller.form,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(
                    controller.state == 0 ? 'Registro' : 'Login',
                    style: TextStyle(fontSize: 32),
                  )),
              SizedBox(
                height: 20,
              ),
              ReactiveTextField(
                formControlName: 'email',
                validationMessages: (control) => {
                  "required": 'El correo es requerido',
                  'email': 'Debe ser un correo valido',
                },
                decoration: InputDecoration(
                    errorMaxLines: 2,
                    prefixIcon:
                        Icon(Icons.email, color: Colors.black, size: 32),
                    labelText: 'Correo'),
              ),
              ReactiveTextField(
                formControlName: 'password',
                obscureText: true,
                validationMessages: (control) => {
                  "required": 'El correo es requerido',
                  'minLength': 'Debe poseer mas de 8 caracteres',
                },
                decoration: InputDecoration(
                    errorMaxLines: 2,
                    prefixIcon:
                        Icon(Icons.password, color: Colors.black, size: 32),
                    labelText: 'Contraseña'),
              ),
              Obx(() => TextButton(
                    child:
                        Text(controller.state == 0 ? 'Registrarse' : 'Login'),
                    onPressed: () {
                      controller.form.valid
                          ? controller.state == 0
                              ? controller.register()
                              : controller.login()
                          : () {};
                    },
                  )),
              Obx(() => TextButton(
                    child: Text(controller.state == 0
                        ? 'Ya estas registrado?'
                        : 'Deseas registrarte?'),
                    onPressed: () {
                      controller.state == 0
                          ? controller.state = 1
                          : controller.state = 0;
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
