import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tcc_frontend/src/core/errors/failure.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/profile_edit_model.dart';
import 'package:tcc_frontend/src/modules/profile/domain/entities/profile_edit_entity.dart';
import 'package:tcc_frontend/src/modules/profile/domain/repositories/i_user_profile_repository.dart';

abstract class IUpdateUserUsecase {
  Future<Either<Failure, void>> call(ProfileEditEntity entity, File? photo);
}

class UpdateUserUsecase extends IUpdateUserUsecase {
  final IUserProfileRepository repository;

  UpdateUserUsecase({required this.repository});

  @override
  Future<Either<Failure, void>> call(ProfileEditEntity entity, File? photo) async {
    var copyEntity = entity;
    if (photo != null) {
      final photoUrl = await repository.uploadPhoto(photo);
      final imageId = photoUrl.fold((l) => null, (r) => r.imageId);
      copyEntity = entity.copyWith(photoUrl: imageId);
    }
    return await repository.updateUser(ProfileEditModel.fromEntity(copyEntity));
  }
}
