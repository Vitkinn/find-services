import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:tcc_frontend/src/modules/profile/domain/entities/profile_evaluation_entity.dart';
import 'package:tcc_frontend/src/modules/profile/domain/entities/user_profile_entity.dart';
import 'package:tcc_frontend/src/modules/profile/domain/usecases/load_evaluations_usecase.dart';
import 'package:tcc_frontend/src/modules/profile/domain/usecases/load_profile_usecase.dart';

class ProfileController {
  late final ILoadProfileUsecase _loadProfileUsecase;
  late final ILoadCurrentUserEvaluationsUsecase _loadEvaluationsUsecase;
  late UserProfileEntity? _userProfile;
  late ServicesEntity _evaluation;
  late bool _isProfileLoading = true;
  late bool _isEvaluationsLoading = true;
  late ValueNotifier<void> stateChange = ValueNotifier(null);
  late String? serviceProviderId;

  bool get isProfileLoading => _isProfileLoading;
  bool get isEvaluationsLoading => _isEvaluationsLoading;

  ProfileController({
    required ILoadProfileUsecase loadProfileUsercase,
    required ILoadCurrentUserEvaluationsUsecase loadEvaluationsUsecase,
  })  : _loadProfileUsecase = loadProfileUsercase,
        _loadEvaluationsUsecase = loadEvaluationsUsecase;

  double rating = 4;

  ServicesEntity get evaluation => _evaluation;
  UserProfileEntity? get userProfile => _userProfile;

  void edit() {
    Modular.to.navigate('/profile_edit');
  }

  void loadPage(String? id) {
    serviceProviderId = id;
    _userProfile = UserProfileEntity();
    _evaluation = ServicesEntity(evaluations: []);
    loadProfile(id);
    loadEvaluations(id);
  }

  String getName(UserProfileEntity? user) {
    return '${user?.name} ${user?.lastName}';
  }

  void loadProfile(String? providerId) async {
    _isProfileLoading = true;
    final userProfileRequest = await _loadProfileUsecase.call(providerId);
    userProfileRequest.fold((l) {
      _isProfileLoading = false;
      stateChange.notifyListeners();
    }, (r) {
      _userProfile = r;
      _isProfileLoading = false;
      stateChange.notifyListeners();
    });
  }

  void loadEvaluations(String? providerId) async {
    _isEvaluationsLoading = true;
    final loadEvaluationsReq = await _loadEvaluationsUsecase.call(providerId);

    loadEvaluationsReq.fold((l) {
      _isEvaluationsLoading = false;
      stateChange.notifyListeners();
    }, (r) {
      _evaluation = r;
      _isEvaluationsLoading = false;
      stateChange.notifyListeners();
    });
  }

  void disposePage() {
    _userProfile = null;
    _evaluation = ServicesEntity(evaluations: []);
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
    if (_userProfile?.createAccountDate != null) {
      final DateFormat formatter = DateFormat('dd/MM/yyyy');
      return formatter.format(_userProfile!.createAccountDate!);
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

  backToHome() {
    Modular.to.navigate('/categories');
  }

  void sendServiceRequest() {
    Modular.to.navigate('/request_service', arguments: {"serviceProviderId": serviceProviderId});
  }
}
