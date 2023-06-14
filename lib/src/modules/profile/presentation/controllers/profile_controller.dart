import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/profile/domain/entities/user_profile_entity.dart';
import 'package:tcc_frontend/src/modules/profile/domain/usecases/load_profile_usecase.dart';

class ProfileController {
  late final ILoadProfileUsecase _loadProfileUsecase;
  late ValueNotifier<UserProfileEntity?> userProfile;
  late bool isProfileLoading = true;
  late bool isEvaluationsLoading = true;

  ProfileController({required ILoadProfileUsecase loadProfileUsercase})
      : _loadProfileUsecase = loadProfileUsercase;

  double rating = 4;

  void edit() {
    Modular.to.navigate('/profile_edit');
  }

  void loadPage() {
    userProfile = ValueNotifier(null);
    loadProfile();
  }

  String getName(UserProfileEntity? user) {
    return '${userProfile.value?.name} ${userProfile.value?.lastName}';
  }

  void loadProfile() async {
    isProfileLoading = true;
    final userProfileRequest = await _loadProfileUsecase.call();
    userProfileRequest.fold((l) {
      isEvaluationsLoading = false;
    }, (r) {
      userProfile.value = r;
      isProfileLoading = false;
    });
  }

  void loadEvaluations() async {}

  void dispose() {
    userProfile.value = null;
    userProfile.dispose();
    isEvaluationsLoading = true;
    isProfileLoading = true;
  }

  String getPhotoUrl() {
    if (userProfile.value == null || userProfile.value?.photoUrl == null) {
      return 'lib/assets/images/user_icon.png';
    }
    return userProfile.value!.photoUrl!;
  }
}
