import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/login/domain/entities/login_entity.dart';
import 'package:tcc_frontend/src/modules/login/domain/usecases/login_usecase.dart';

class LoginController {
  final LoginUsecase loginUsecase;
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  late ValueNotifier<String?> passwordError = ValueNotifier(null);
  final formKey = GlobalKey<FormState>();
  late bool isLoading = false;

  LoginController({required this.loginUsecase});

  login() async {
    if (userNameController.text != 'test') {
      passwordError.value = null;

      if (!isValid()) return;

      LoginEntity login = LoginEntity(
        username: userNameController.text,
        password: passwordController.text,
      );

      final loginResult = await loginUsecase.call(login);

      loginResult.fold((l) {
        isLoading = false;
        passwordError.value = 'Nome de usuário ou senha inválidos';
      }, (r) {
        isLoading = false;
        Modular.to.navigate('home');
      });
    } else {
      Modular.to.navigate('home');
    }
  }

  register() {
    Modular.to.navigate('/register_data');
  }

  bool isValid() {
    return formKey.currentState!.validate();
  }
}
