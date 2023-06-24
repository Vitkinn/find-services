import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tcc_frontend/src/core/errors/failure.dart';
import 'package:tcc_frontend/src/modules/profile/data/datasource/i_user_profile_datasource.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/profile_edit_model.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/profile_evaluation_model.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/user_profile_model.dart';
import 'package:tcc_frontend/src/modules/profile/domain/repositories/i_user_profile_repository.dart';
import 'package:tcc_frontend/src/modules/user_registration/data/models/image_id_model.dart';

class UserProfileRepository extends IUserProfileRepository {
  final IUserProfileDatasource datasource;

  UserProfileRepository({required this.datasource});

  @override
  Future<Either<Failure, UserProfileModel>> loadUserProfile(String userId) async {
    try {
      final result = await datasource.loadUserProfile(userId);

      return right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnhandledFailure());
    }
  }

  @override
  Future<Either<Failure, ProfileEvaluationModel>> loadProfileEvaluations(
    String userId,
  ) async {
    try {
      final result = await datasource.loadProfileEvaluations(userId);

      return right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnhandledFailure());
    }
  }

  @override
  Future<Either<Failure, ProfileEditModel>> loadUserEditData() async {
    try {
      final result = await datasource.loadUserEdit();

      return right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnhandledFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateUser(ProfileEditModel entity) async {
    try {
      await datasource.editUser(entity);

      return right(null);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnhandledFailure());
    }
  }

  @override
  Future<Either<Failure, ImageIdModel>> uploadPhoto(File photo) async {
    try {
      final result = await datasource.uploadPhoto(photo);

      return right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnhandledFailure());
    }
  }
}
