import 'package:flutter/material.dart';
import 'package:tcc_frontend/src/modules/user_registration/domain/entities/user_entity.dart';
import 'package:tcc_frontend/src/modules/user_registration/domain/usecases/create_user_usecase.dart';

class NewUserController {
  final ICreateUserUsecase createUserUsecase;

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final cpfController = TextEditingController();

  NewUserController({required this.createUserUsecase});

  Future<void> create() async {
    final user = UserEntity(
      cpf: cpfController.text,
      complement: cpfController.text,
      fullname: cpfController.text,
      login: cpfController.text,
      password: cpfController.text,
      phone: cpfController.text,
      number: cpfController.text,
    );
    final result = await createUserUsecase(user);

    result.fold((l) => null, (r) => {});
  }
}
