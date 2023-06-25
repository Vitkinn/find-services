import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
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
  final ValueNotifier<bool> loading = ValueNotifier(false);

  final GlobalKey<FormState> _formRegisterData = GlobalKey<FormState>();
  final GlobalKey<FormState> _formRegisterPhoto = GlobalKey<FormState>();
  final GlobalKey<FormState> _formRegisterPassword = GlobalKey<FormState>();

  final ValueNotifier<File?> _image = ValueNotifier(null);

  NewUserController({required this.createUserUsecase});

  Future<void> create() async {
    loading.value = true;
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
    final result = await createUserUsecase(user, _image.value);

    result.fold((l) => null, (r) => {Modular.to.navigate('/')});
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

  Future pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      _image.value = File(image.path);
    } on PlatformException catch (e) {
      print('Erro ao carregar a imagem: $e');
    }
  }

  Future pickImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      _image.value = File(image.path);
    } on PlatformException catch (e) {
      print('Erro ao carregar a imagem: $e');
    }
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
  ValueNotifier<File?> get image => _image;

  set termsChecked(bool? value) {
    _isTermsTouched = true;
    _isTermsChecked = value ?? false;
  }
}
