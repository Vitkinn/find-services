import 'package:dartz/dartz.dart';
import 'package:tcc_frontend/src/modules/login/data/models/loged_user_model.dart';
import 'package:tcc_frontend/src/modules/login/data/models/login_model.dart';
import 'package:tcc_frontend/src/modules/login/domain/entities/loged_user_entity.dart';
import 'package:tcc_frontend/src/modules/login/domain/entities/login_entity.dart';
import 'package:tcc_frontend/src/modules/login/domain/repositories/i_login_repository.dart';
import 'package:tcc_frontend/src/modules/shared/controllers/i_auth_controller.dart';

import '../../../../core/errors/failure.dart';

abstract class ILoginUsecase {
  Future<Either<Failure, LogedUserEntity>> call(LoginEntity entity);
}

class LoginUsecase extends ILoginUsecase {
  final ILoginRepository repository;
  final IAuthController authController;

  LoginUsecase({
    required this.repository,
    required this.authController,
  });

  @override
  Future<Either<Failure, LogedUserEntity>> call(LoginEntity entity) async {
    Either<Failure, LogedUserModel> result =
        await repository.login(LoginModel.fromEntity(entity));
    result.fold((l) {}, (r) {
      authController.login(r);
    });
    return result;
  }
}
