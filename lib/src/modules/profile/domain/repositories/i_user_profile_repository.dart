import 'package:dartz/dartz.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/profile_edit_model.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/profile_evaluation_model.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/user_profile_model.dart';

import '../../../../core/errors/failure.dart';

abstract class IUserProfileRepository {
  Future<Either<Failure, UserProfileModel>> loadUserProfile(String userId);
  Future<Either<Failure, ProfileEditModel>> loadUserEditData();
  Future<Either<Failure, ProfileEvaluationModel>> loadProfileEvaluations(String userId);
  Future<Either<Failure, void>> updateUser(ProfileEditModel entity);
}
