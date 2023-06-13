import 'package:tcc_frontend/src/core/rest_client/rest_client.dart';
import 'package:tcc_frontend/src/modules/profile/data/datasource/i_user_profile_datasource.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/profile_evaluation_model.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/user_profile_model.dart';

class UserProfileDatasource extends IUserProfileDatasource {
  late final RestClient restClient;

  UserProfileDatasource({required RestClient restClient});

  @override
  Future<UserProfileModel> loadUserProfile(String userId) async {
    final resutl = await restClient.get('/api/user/${userId.toString()}');
    return UserProfileModel.fromMap(resutl.data);
  }

  @override
  Future<ProfileEvaluationModel> loadProfileEvaluations(String userId) {
    throw UnimplementedError();
  }
}
