import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/login/domain/entities/role_type.dart';
import 'package:tcc_frontend/src/modules/profile/domain/entities/profile_edit_entity.dart';
import 'package:tcc_frontend/src/modules/profile/domain/usecases/load_current_user_profile.dart';
import 'package:tcc_frontend/src/modules/profile/domain/usecases/update_user_usecase.dart';
import 'package:tcc_frontend/src/modules/shared/controllers/i_auth_controller.dart';
import 'package:tcc_frontend/src/modules/user_registration/domain/entities/user_entity.dart';

class ProfileEditController {
  late final ILoadCurrentUserProfileUsecase _loadCurrentUserProfileUsecase;
  late final IUpdateUserUsecase _updateUserUsecase;
  late final IAuthController _authController;

  final userNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = MaskedTextController(mask: '(00) 00000-0000');
  final cpfController = MaskedTextController(mask: '000.000.000-00');
  final cepController = TextEditingController();
  final neighborhoodController = TextEditingController();
  final cityController = TextEditingController();
  final ufController = TextEditingController();
  final streetController = TextEditingController();
  final numberController = TextEditingController();
  final complementController = TextEditingController();
  final referencePointController = TextEditingController();
  String? photoUrl;
  String? userPhotoName;
  File? _image;
  Option? selectedCategory;
  final cnpjController = MaskedTextController(mask: '00.000.000/0000-00');
  final categoryController = TextEditingController();
  final descriptionController = TextEditingController();
  final List<TextEditingController> citiesController = [];
  String? photo;
  bool isServiceProvider = false;

  final GlobalKey<FormState> _userFormState = GlobalKey<FormState>();
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<Option> options = [
    Option(key: 'PLUMBER', value: 'Encanador'),
    Option(key: 'ELECTRICIAN', value: 'Eletrecista'),
    Option(key: 'MASON', value: 'Pedreiro'),
    Option(key: 'MASONS_ASSISTANT', value: 'Assistente de predreiro'),
    Option(key: 'MECHANIC', value: 'Mecânico'),
    Option(key: 'ENGINEER', value: 'Engenheiro'),
    Option(key: 'ARCHITECT', value: 'Arquiteto'),
    Option(key: 'FORWARDING_AGENT', value: 'Despachante'),
  ];

  ProfileEditController({
    required ILoadCurrentUserProfileUsecase loadCurrentUserProfileUsecase,
    required IUpdateUserUsecase updateUserUsecase,
    required IAuthController authController,
  })  : _loadCurrentUserProfileUsecase = loadCurrentUserProfileUsecase,
        _authController = authController,
        _updateUserUsecase = updateUserUsecase;

  void save() async {
    if (_userFormState.currentState!.validate()) {
      _loading.value = true;
      var phone = phoneController.text
          .replaceAll('(', '')
          .replaceAll(')', '')
          .replaceAll('-', '')
          .replaceAll(' ', '');
      var cpf = cpfController.text.replaceAll('.', '').replaceAll('-', '');

      var user = ProfileEditEntity(
        name: userNameController.text,
        lastName: lastNameController.text,
        cpf: cpf,
        login: emailController.text,
        phone: phone,
        photoUrl: photoUrl,
        userPhotoName: userPhotoName,
      );

      if (_authController.getCurrentUser().role == RoleType.serviceProvider || isServiceProvider) {
        user = user.copyWith(
          category: selectedCategory?.key,
          cnpj: cnpjController.text.replaceAll('.', '').replaceAll('/', '').replaceAll('-', ''),
          description: descriptionController.text,
          actuationCities:
              citiesController.map((TextEditingController cityCont) => cityCont.text).toList(),
        );
      }
      final result = await _updateUserUsecase.call(user, image);
      result.fold((l) => null, (r) {
        image = null;
        if (isServiceProvider) {
          _authController.toServiceProvider();
        }
        Modular.to.navigate('/profile');
      });
    }
  }

  void cancel() {
    Modular.to.navigate('/profile');
  }

  bool showSaveCancelButtons() {
    return true;
  }

  void toggleServiceProvider(bool value) {
    isServiceProvider = value;
  }

  void loadUserData() async {
    _loading.value = true;
    final result = await _loadCurrentUserProfileUsecase.call();
    result.fold((l) {
      _loading.value = false;
    }, (r) {
      userNameController.text = r.name!;
      lastNameController.text = r.lastName!;
      cpfController.text = r.cpf!;
      emailController.text = r.login!;
      phoneController.text = r.phone!;
      if (r.photoUrl != null) {
        photoUrl = r.photoUrl;
        userPhotoName = r.userPhotoName;
      }
      if (r.cnpj != null) {
        selectedCategory = options.firstWhere((element) => element.key == r.category);
        isServiceProvider = true;
        cnpjController.text = r.cnpj!;
        descriptionController.text = r.description!;
        categoryController.text = r.category!;
        citiesController.clear();
        citiesController.addAll(
          r.actuationCities!.map((city) => TextEditingController(text: city)),
        );
      }
      _loading.value = false;
    });

    if (isServiceProvider && citiesController.isEmpty) {
      citiesController.add(TextEditingController());
    }
  }

  ValueNotifier<bool> get isLoading => _loading;
  GlobalKey<FormState> get userFormState => _userFormState;
  set image(File? image) {
    _image = image;
  }

  File? get image => _image;

  void checkServiceProvider(bool? data) {
    isServiceProvider = (Modular.args.data?['createServicePrivider'] as bool?) ?? false;
    if (!isServiceProvider) {
      isServiceProvider = _authController.getCurrentUser().role == RoleType.serviceProvider;
    }
  }
}

class Option {
  final String key;
  final String value;

  Option({required this.key, required this.value});
}
