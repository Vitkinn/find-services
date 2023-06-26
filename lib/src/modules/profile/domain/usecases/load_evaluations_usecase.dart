import 'package:dartz/dartz.dart';
import 'package:tcc_frontend/src/core/errors/failure.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/profile_evaluation_model.dart';
import 'package:tcc_frontend/src/modules/profile/domain/repositories/i_user_profile_repository.dart';
import 'package:tcc_frontend/src/modules/shared/controllers/i_auth_controller.dart';

abstract class ILoadCurrentUserEvaluationsUsecase {
  Future<Either<Failure, ProfileEvaluationModel>> call(String? obj);
}

class LoadCurrentUserEvaluationsUsecase extends ILoadCurrentUserEvaluationsUsecase {
  final IUserProfileRepository repository;
  final IAuthController authController;

  LoadCurrentUserEvaluationsUsecase({
    required this.repository,
    required this.authController,
  });

  @override
  Future<Either<Failure, ProfileEvaluationModel>> call(String? obj) async {
    String userId = authController.getCurrentUserId();
    if (obj != null){
      userId = obj;
    }
    return repository.loadProfileEvaluations(userId);
  }
}
