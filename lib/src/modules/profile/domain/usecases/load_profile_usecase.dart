import 'package:dartz/dartz.dart';
import 'package:tcc_frontend/src/core/errors/failure.dart';
import 'package:tcc_frontend/src/modules/profile/domain/entities/user_profile_entity.dart';
import 'package:tcc_frontend/src/modules/profile/domain/repositories/i_user_profile_repository.dart';
import 'package:tcc_frontend/src/modules/shared/controllers/i_auth_controller.dart';

abstract class ILoadProfileUsecase {
  Future<Either<Failure, UserProfileEntity>> call(String? obj);
}

class LoadProfileUsecase extends ILoadProfileUsecase {
  final IUserProfileRepository repository;
  final IAuthController authController;

  LoadProfileUsecase({
    required this.repository,
    required this.authController,
  });

  @override
  Future<Either<Failure, UserProfileEntity>> call(String? obj) async {
    String userId = authController.getCurrentUserId();
    if (obj != null){
      userId = obj;
    }
    return repository.loadUserProfile(userId);
  }
}
