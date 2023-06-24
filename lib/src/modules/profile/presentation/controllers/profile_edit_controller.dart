import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/profile_edit_model.dart';
import 'package:tcc_frontend/src/modules/profile/domain/usecases/load_current_user_profile.dart';
import 'package:tcc_frontend/src/modules/profile/domain/usecases/update_user_usecase.dart';

class ProfileEditController {
  late final ILoadCurrentUserProfileUsecase _loadCurrentUserProfileUsecase;
  late final IUpdateUserUsecase _updateUserUsecase;

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

  final GlobalKey<FormState> _userFormState = GlobalKey<FormState>();
  final ValueNotifier<bool> _loading = ValueNotifier(true);

  ProfileEditController({
    required ILoadCurrentUserProfileUsecase loadCurrentUserProfileUsecase,
    required IUpdateUserUsecase updateUserUsecase,
  })  : _loadCurrentUserProfileUsecase = loadCurrentUserProfileUsecase,
        _updateUserUsecase = updateUserUsecase;

  void save() async {
    if (_userFormState.currentState!.validate()) {
      final user = ProfileEditModel(
        name: userNameController.text,
        lastName: lastNameController.text,
        cpf: cpfController.text,
        login: emailController.text,
        phone: phoneController.text,
        photoUrl: photoUrl,
      );

      final result = await _updateUserUsecase.call(user, image);
      result.fold((l) => null, (r) {
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
      _loading.value = false;
    });
  }

  ValueNotifier<bool> get isLoading => _loading;
  GlobalKey<FormState> get userFormState => _userFormState;
  set image(File? image) {
    _image = image;
  }

  File? get image => _image;
}
