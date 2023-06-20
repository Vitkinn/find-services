import 'package:tcc_frontend/src/core/rest_client/rest_client.dart';
import 'package:tcc_frontend/src/modules/profile/data/datasource/i_user_profile_datasource.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/profile_edit_model.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/profile_evaluation_model.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/user_profile_model.dart';

class UserProfileDatasource extends IUserProfileDatasource {
  final RestClient restClient;

  UserProfileDatasource({required this.restClient});

  @override
  Future<UserProfileModel> loadUserProfile(String userId) async {
    final result = await restClient.get('/api/user/${userId.toString()}');
    return UserProfileModel.fromMap(result.data);
  }

  @override
  Future<ProfileEvaluationModel> loadProfileEvaluations(String userId) async {
    final result = await restClient.get('/api/profileEvaluation/${userId.toString()}');
    return ProfileEvaluationModel.fromMap(result.data);
  }

  @override
  Future<void> editUser(ProfileEditModel data) async {
    await restClient.put('/api/user', data: data);
  }

  @override
  Future<ProfileEditModel> loadUserEdit() async {
    final result = await restClient.get('/api/user');
    return ProfileEditModel.fromMap(result.data);
  }
}
