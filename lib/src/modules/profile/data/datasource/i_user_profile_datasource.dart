import 'package:tcc_frontend/src/modules/profile/data/models/profile_evaluation_model.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/user_profile_model.dart';
import 'package:uuid/uuid.dart';

abstract class IUserProfileDatasource {
  Future<UserProfileModel> loadUserProfile(Uuid userId);
  Future<ProfileEvaluationModel> loadProfileEvaluations(Uuid userId);
}
