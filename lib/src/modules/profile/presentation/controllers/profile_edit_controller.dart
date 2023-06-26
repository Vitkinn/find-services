import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/login/domain/entities/role_type.dart';
import 'package:tcc_frontend/src/modules/profile/domain/entities/profile_edit_entity.dart';
import 'package:tcc_frontend/src/modules/profile/domain/usecases/load_current_user_profile.dart';
import 'package:tcc_frontend/src/modules/profile/domain/usecases/update_user_usecase.dart';
import 'package:tcc_frontend/src/modules/shared/controllers/i_auth_controller.dart';

class ProfileEditController {
  late final ILoadCurrentUserProfileUsecase _loadCurrentUserProfileUsecase;
  late final IUpdateUserUsecase _updateUserUsecase;
  late final IAuthController _authController;

  final userNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final cpfController = TextEditingController();
  final cepController = TextEditingController();
  final neighborhoodController = TextEditingController();
  final cityController = TextEditingController();
  final ufController = TextEditingController();
  final streetController = TextEditingController();
  final numberController = TextEditingController();
  final complementController = TextEditingController();
  final referencePointController = TextEditingController();
  String? photoUrl;
  File? _image;
  final cnpjController = TextEditingController();
  final categoryController = TextEditingController();
  final descriptionController = TextEditingController();
  final List<TextEditingController> citiesController = [];
  String? photo;
  bool isServiceProvider = false;

  final GlobalKey<FormState> _userFormState = GlobalKey<FormState>();
  final ValueNotifier<bool> _loading = ValueNotifier(true);

  ProfileEditController({
    required ILoadCurrentUserProfileUsecase loadCurrentUserProfileUsecase,
    required IUpdateUserUsecase updateUserUsecase,
    required IAuthController authController,
  })  : _loadCurrentUserProfileUsecase = loadCurrentUserProfileUsecase,
        _authController = authController,
        _updateUserUsecase = updateUserUsecase;

  void save() async {
    if (_userFormState.currentState!.validate()) {
      var user = ProfileEditEntity(
        name: userNameController.text,
        lastName: lastNameController.text,
        cpf: cpfController.text,
        login: emailController.text,
        phone: phoneController.text,
        photoUrl: photoUrl,
      );

      if (_authController.getCurrentUser().role == RoleType.serviceProvider || isServiceProvider) {
        user = user.copyWith(
          category: categoryController.text,
          cnpj: cnpjController.text,
          description: descriptionController.text,
          actuationCities:
              citiesController.map((TextEditingController cityCont) => cityCont.text).toList(),
        );
      }
      final result = await _updateUserUsecase.call(user, image);
      result.fold((l) => null, (r) {
        _authController.toServiceProvider();
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
    result.fold((l) => null, (r) {
      userNameController.text = r.name!;
      lastNameController.text = r.lastName!;
      cpfController.text = r.cpf!;
      emailController.text = r.login!;
      phoneController.text = r.phone!;
      if (r.photoUrl != null) {
        photoUrl = r.photoUrl;
      }
      if (r.cnpj != null) {
        cnpjController.text = r.cnpj!;
        descriptionController.text = r.description!;
        categoryController.text = r.category!;
        citiesController.clear();
        citiesController
            .addAll(r.actuationCities!.map((city) => TextEditingController(text: city)));
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
