import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/login/domain/entities/login_entity.dart';
import 'package:tcc_frontend/src/modules/login/domain/usecases/login_usecase.dart';

class LoginController {
  final LoginUsecase loginUsecase;
  final ValueNotifier<void> notifyPage = ValueNotifier(null);
  late final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  late ValueNotifier<String?> passwordError = ValueNotifier(null);
  final formKey = GlobalKey<FormState>();

  LoginController({required this.loginUsecase});

  login() async {
    passwordError.value = null;
    _isLoading.value = true;

    if (!isValid()) return;

    LoginEntity login = LoginEntity(
      username: userNameController.text,
      password: passwordController.text,
    );

    final loginResult = await loginUsecase.call(login);

    loginResult.fold((l) {
      _isLoading.value = false;
      passwordError.value = 'Nome de usuário ou senha inválidos';
    }, (r) {
      _isLoading.value = false;
      Modular.to.navigate('categories');
    });
  }

  register() {
    Modular.to.navigate('/register_data');
  }

  bool isValid() {
    return formKey.currentState!.validate();
  }

  ValueNotifier<bool> get isLoading => _isLoading;
}
