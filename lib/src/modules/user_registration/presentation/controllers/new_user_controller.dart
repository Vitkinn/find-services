import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/user_registration/domain/entities/user_entity.dart';
import 'package:tcc_frontend/src/modules/user_registration/domain/usecases/create_user_usecase.dart';

class NewUserController extends ChangeNotifier {
  final ICreateUserUsecase createUserUsecase;

  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cpfController = TextEditingController();
  bool _isTermsChecked = false;
  bool _isTermsTouched = false;

  final GlobalKey<FormState> _formRegisterData = GlobalKey<FormState>();
  final GlobalKey<FormState> _formRegisterPhoto = GlobalKey<FormState>();
  final GlobalKey<FormState> _formRegisterPassword = GlobalKey<FormState>();

  NewUserController({required this.createUserUsecase});

  Future<void> create() async {
    final user = UserEntity(
      cpf: cpfController.text,
      name: _nameController.text,
      lastName: _lastNameController.text,
      login: _emailController.text,
      password: passwordController.text,
      phone: phoneController.text,
      complement: cpfController.text,
      number: cpfController.text,
    );
    final result = await createUserUsecase(user);

    result.fold((l) => null, (r) => {});
  }

  void cancel() {
    Modular.to.navigate('/');
  }

  void registerDataAdvance() {
    if (registerDataIsValid() && _isTermsChecked) {
      Modular.to.navigate('/register_photo');
    } else {
      _isTermsTouched = true;
      notifyListeners();
    }
  }

  void registerPasswordAdvance() {
    if (registerPasswordIsValid()) {
      create();
    }
  }

  bool registerDataIsValid() {
    return _formRegisterData.currentState!.validate();
  }

  bool registerPhotoIsValid() {
    return _formRegisterPhoto.currentState!.validate();
  }

  bool registerPasswordIsValid() {
    return _formRegisterPassword.currentState!.validate();
  }

  get nameController => _nameController;
  get lastNameController => _lastNameController;
  get passwordController => _passwordController;
  get emailController => _emailController;
  get confirmPasswordController => _confirmPasswordController;
  get phoneController => _phoneController;
  get cpfController => _cpfController;
  get formRegisterData => _formRegisterData;
  get formRegisterPhoto => _formRegisterPhoto;
  get formRegisterPassword => _formRegisterPassword;
  get isTermsChecked => _isTermsChecked;
  get isTermsTouched => _isTermsTouched;
  set termsChecked(bool? value) {
    _isTermsTouched = true;
    _isTermsChecked = value ?? false;
  }
}
