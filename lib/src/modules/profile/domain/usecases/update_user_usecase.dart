import 'package:dartz/dartz.dart';
import 'package:tcc_frontend/src/core/errors/failure.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/profile_edit_model.dart';
import 'package:tcc_frontend/src/modules/profile/domain/repositories/i_user_profile_repository.dart';

abstract class IUpdateUserUsecase {
  Future<Either<Failure, void>> call(ProfileEditModel entity);
}

class UpdateUserUsecase extends IUpdateUserUsecase {
  final IUserProfileRepository repository;

  UpdateUserUsecase({required this.repository});

  @override
  Future<Either<Failure, void>> call(ProfileEditModel entity) async {
    return await repository.updateUser(entity);
  }
}
