import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/profile/domain/usecases/load_profile_usecase.dart';

class ProfileController {
  late final ILoadProfileUsecase _loadProfileUsecase;

  ProfileController({required ILoadProfileUsecase loadProfileUsercase})
      : _loadProfileUsecase = loadProfileUsercase;

  double rating = 4;

  void edit() {
    Modular.to.navigate('/profile_edit');
  }

  void loadProfile() {
    _loadProfileUsecase.call();
  }
}
