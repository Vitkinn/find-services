import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/profile_edit_model.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/profile_evaluation_model.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/user_profile_model.dart';
import 'package:tcc_frontend/src/modules/user_registration/data/models/image_id_model.dart';

import '../../../../core/errors/failure.dart';

abstract class IUserProfileRepository {
  Future<Either<Failure, UserProfileModel>> loadUserProfile(String userId);
  Future<Either<Failure, ProfileEditModel>> loadUserEditData();
  Future<Either<Failure, ProfileEvaluationModel>> loadProfileEvaluations(String userId);
  Future<Either<Failure, ProfileEditModel>> updateUser(ProfileEditModel entity);
  Future<Either<Failure, ImageIdModel>> uploadPhoto(XFile photo);
}
