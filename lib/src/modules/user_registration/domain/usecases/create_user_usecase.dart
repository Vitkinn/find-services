import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:findservices/src/modules/shared/controllers/impl/image_compress_controller.dart';
import 'package:findservices/src/modules/user_registration/domain/entities/user_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/user_model.dart';
import '../repositories/i_user_repository.dart';

abstract class ICreateUserUsecase {
  Future<Either<Failure, Unit>> call(UserEntity entity, File? photo);
}

class CreateUserUsecase extends ICreateUserUsecase {
  late final IUserRepository repository;
  late final ImageCompressController imageCompressController;

  CreateUserUsecase(
      {required this.repository, required this.imageCompressController});

  @override
  Future<Either<Failure, Unit>> call(UserEntity entity, File? photo) async {
    var copyEntity = entity;
    if (photo != null) {
      final compressedPhoto =
          await imageCompressController.compressImage(photo);
      final photoUrl = await repository.uploadPhoto(compressedPhoto);
      final imageId = photoUrl.fold((l) => null, (r) => r.imageId);
      copyEntity = entity.copyWith(userPhotoUrl: imageId);
    }
    return await repository.createUser(UserModel.fromEntity(copyEntity));
  }
}
