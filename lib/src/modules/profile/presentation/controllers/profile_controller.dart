import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/profile/domain/entities/user_profile_entity.dart';
import 'package:tcc_frontend/src/modules/profile/domain/usecases/load_profile_usecase.dart';

class ProfileController {
  late final ILoadProfileUsecase _loadProfileUsecase;
  late final ValueNotifier<UserProfileEntity?> userProfile = ValueNotifier(null);
  late bool isProfileLoading = true;
  late bool isEvaluationsLoading = true;

  ProfileController({required ILoadProfileUsecase loadProfileUsercase})
      : _loadProfileUsecase = loadProfileUsercase;

  double rating = 4;

  void edit() {
    Modular.to.navigate('/profile_edit');
  }

  void loadPage() {
    loadProfile();
  }

  void loadProfile() async {
    final userProfileRequest = await _loadProfileUsecase.call();
    userProfileRequest.fold((l) {
      print("Deu errado");
    }, (r) {
      print("deu certo");
      isProfileLoading = false;
      userProfile.value = r;
    });
  }

  void loadEvaluations() async {}
}
