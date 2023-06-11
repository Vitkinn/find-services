import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/login/domain/entities/login_entity.dart';
import 'package:tcc_frontend/src/modules/login/domain/usecases/login_usecase.dart';

class LoginController {
  final LoginUsecase loginUsecase;
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginController({required this.loginUsecase});

  login() {
    LoginEntity login = LoginEntity(
      login: userNameController.text,
      password: passwordController.text,
    );

    loginUsecase.call(login);
    Modular.to.navigate('home');
  }

  register() {
    Modular.to.navigate('register_data');
  }
}
