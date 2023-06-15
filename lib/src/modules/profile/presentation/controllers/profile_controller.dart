import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/profile/domain/entities/profile_evaluation_entity.dart';
import 'package:tcc_frontend/src/modules/profile/domain/entities/user_profile_entity.dart';
import 'package:tcc_frontend/src/modules/profile/domain/usecases/load_evaluations_usecase.dart';
import 'package:tcc_frontend/src/modules/profile/domain/usecases/load_profile_usecase.dart';

class ProfileController extends ChangeNotifier {
  late final ILoadProfileUsecase _loadProfileUsecase;
  // late final ILoadCurrentUserEvaluationsUsecase _loadEvaluationsUsecase;
  late final ValueNotifier<UserProfileEntity?> userProfile;
  late final ValueNotifier<ProfileEvaluationEntity?> _evaluations;
  late bool _isProfileLoading = true;
  late bool _isEvaluationsLoading = true;

  bool get isProfileLoading => _isProfileLoading;
  bool get isEvaluationsLoading => _isEvaluationsLoading;

  ProfileController({
    required ILoadProfileUsecase loadProfileUsercase,
    required ILoadCurrentUserEvaluationsUsecase loadEvaluationsUsecase,
  }) : _loadProfileUsecase = loadProfileUsercase;
  // _loadEvaluationsUsecase = loadEvaluationsUsecase;

  double rating = 4;

  ProfileEvaluationEntity get evaluation =>
      _evaluations.value ?? ProfileEvaluationEntity(evaluations: []);

  void edit() {
    Modular.to.navigate('/profile_edit');
  }

  void loadPage() {
    userProfile = ValueNotifier(null);
    _evaluations = ValueNotifier(null);
    loadProfile();
    loadEvaluations();
  }

  String getName(UserProfileEntity? user) {
    return '${userProfile.value?.name} ${userProfile.value?.lastName}';
  }

  void loadProfile() async {
    _isProfileLoading = true;
    final userProfileRequest = await _loadProfileUsecase.call();
    userProfileRequest.fold((l) {
      _isProfileLoading = false;
      notifyListeners();
    }, (r) {
      userProfile.value = r;
      _isProfileLoading = false;
      notifyListeners();
    });
  }

  void loadEvaluations() async {
    // _isEvaluationsLoading = true;
    // final userProfileRequest = await _loadProfileUsecase.call();

    // userProfileRequest.fold((l) {
    //   _isEvaluationsLoading = false;
    //   notifyListeners();
    // }, (r) {
    //   userProfile.value = r;
    //   _isEvaluationsLoading = false;
    //   notifyListeners();
    // });
  }

  void disposePage() {
    userProfile.value = null;
    userProfile.dispose();
    _isEvaluationsLoading = true;
    _isProfileLoading = true;
  }

  ImageProvider getImage() {
    if (userProfile.value?.photoUrl != null && userProfile.value?.photoUrl != "") {
      return NetworkImage(userProfile.value!.photoUrl!);
    }
    return const AssetImage('lib/assets/images/user_icon.png');
  }

  EvaluationEntity getEvaluation(int index) {
    return evaluation.evaluations![index];
  }
}
