import 'package:dartz/dartz.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/profile_evaluation_model.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/user_profile_model.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/errors/failure.dart';

abstract class IUserProfileRepository {
  Future<Either<Failure, UserProfileModel>> loadUserProfile(Uuid userId);
  Future<Either<Failure, ProfileEvaluationModel>> loadProfileEvaluations(
      Uuid userId);
}
