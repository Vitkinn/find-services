import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:findservices/src/core/rest_client/rest_client.dart';
import 'package:findservices/src/modules/profile/data/datasource/i_user_profile_datasource.dart';
import 'package:findservices/src/modules/profile/data/models/profile_edit_model.dart';
import 'package:findservices/src/modules/profile/data/models/profile_evaluation_model.dart';
import 'package:findservices/src/modules/profile/data/models/user_profile_model.dart';
import 'package:findservices/src/modules/user_registration/data/models/image_id_model.dart';

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
    final result =
        await restClient.get('/api/profileEvaluation/${userId.toString()}');
    return ProfileEvaluationModel.fromMap(result.data);
  }

  @override
  Future<ProfileEditModel> editUser(ProfileEditModel data) async {
    final user = await restClient.put('/api/user', data: data.toMap());
    return ProfileEditModel.fromMap(user.data);
  }

  @override
  Future<ProfileEditModel> loadUserEdit() async {
    final result = await restClient.get('/api/user');
    return ProfileEditModel.fromMap(result.data);
  }

  @override
  Future<ImageIdModel> uploadPhoto(XFile photo) async {
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(photo.path),
    });

    final response = await restClient.post(
      '/api/user/uploadPhoto',
      data: formData,
      headers: {"Authorization": ""},
    );
    return ImageIdModel.fromMap(response.data);
  }
}
