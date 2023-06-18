import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:tcc_frontend/src/modules/profile/domain/entities/profile_evaluation_entity.dart';
import 'package:tcc_frontend/src/modules/profile/domain/entities/user_profile_entity.dart';
import 'package:tcc_frontend/src/modules/profile/domain/usecases/load_evaluations_usecase.dart';
import 'package:tcc_frontend/src/modules/profile/domain/usecases/load_profile_usecase.dart';

class ProfileController extends ChangeNotifier {
  late final ILoadProfileUsecase _loadProfileUsecase;
  late final ILoadCurrentUserEvaluationsUsecase _loadEvaluationsUsecase;
  late final ValueNotifier<UserProfileEntity?> _userProfile;
  late ProfileEvaluationEntity _evaluation;
  late bool _isProfileLoading = true;
  late bool _isEvaluationsLoading = true;

  bool get isProfileLoading => _isProfileLoading;
  bool get isEvaluationsLoading => _isEvaluationsLoading;

  ProfileController({
    required ILoadProfileUsecase loadProfileUsercase,
    required ILoadCurrentUserEvaluationsUsecase loadEvaluationsUsecase,
  })  : _loadProfileUsecase = loadProfileUsercase,
        _loadEvaluationsUsecase = loadEvaluationsUsecase;

  double rating = 4;

  ProfileEvaluationEntity get evaluation => _evaluation;
  ValueNotifier<UserProfileEntity?> get userProfile => _userProfile;

  void edit() {
    Modular.to.navigate('/profile_edit');
  }

  void loadPage() {
    _userProfile = ValueNotifier(null);
    _evaluation = ProfileEvaluationEntity(evaluations: []);
    loadProfile();
    loadEvaluations();
  }

  String getName(UserProfileEntity? user) {
    return '${user?.name} ${user?.lastName}';
  }

  void loadProfile() async {
    _isProfileLoading = true;
    final userProfileRequest = await _loadProfileUsecase.call();
    userProfileRequest.fold((l) {
      _isProfileLoading = false;
      notifyListeners();
    }, (r) {
      _userProfile.value = r;
      _isProfileLoading = false;
      notifyListeners();
    });
  }

  void loadEvaluations() async {
    _isEvaluationsLoading = true;
    final loadEvaluationsReq = await _loadEvaluationsUsecase.call();

    loadEvaluationsReq.fold((l) {
      _isEvaluationsLoading = false;
      notifyListeners();
    }, (r) {
      _evaluation = r;
      _isEvaluationsLoading = false;
      notifyListeners();
    });
  }

  void disposePage() {
    _userProfile.value = null;
    _userProfile.dispose();
    _evaluation = ProfileEvaluationEntity(evaluations: []);
    _isEvaluationsLoading = true;
    _isProfileLoading = true;
  }

  EvaluationEntity getEvaluation(int index) {
    return _evaluation.evaluations![index];
  }

  int getEvaluationsSize() {
    return _evaluation.evaluations?.length ?? 0;
  }

  String getCreateAccountDate() {
    if (_userProfile.value != null) {
      final DateFormat formatter = DateFormat('dd/MM/yyyy');
      return formatter.format(_userProfile.value!.createAccountDate!);
    }
    return '';
  }

  String getEvaluationDate(EvaluationEntity evaluation) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(evaluation.evaluationDate!);
  }

  double getUserRating() {
    if (!_isEvaluationsLoading && evaluation.rate != null) {
      return double.parse(evaluation.rate.toString());
    }
    return 0.0;
  }
}
