import 'package:tcc_frontend/src/core/rest_client/rest_client.dart';
import 'package:tcc_frontend/src/modules/profile/data/datasource/i_user_profile_datasource.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/profile_evaluation_model.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/user_profile_model.dart';
import 'package:uuid/uuid.dart';

class UserProfileDatasource extends IUserProfileDatasource {
  late final RestClient restClient;

  UserProfileDatasource({required RestClient restClient});

  @override
  Future<UserProfileModel> loadUserProfile(Uuid userId) {
    throw UnimplementedError();
  }

  @override
  Future<ProfileEvaluationModel> loadProfileEvaluations(Uuid userId) {
    throw UnimplementedError();
  }
}
