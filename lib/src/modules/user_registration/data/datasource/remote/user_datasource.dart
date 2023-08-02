import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:findservices/src/core/rest_client/rest_client.dart';
import 'package:findservices/src/modules/user_registration/data/models/image_id_model.dart';
import 'package:findservices/src/modules/user_registration/data/models/user_model.dart';

import '../i_user_datasource.dart';

class UserDatasource extends IUserDatasource {
  late final RestClient restClient;

  UserDatasource({required this.restClient});

  @override
  Future<void> createUser(UserModel user) async {
    restClient.post(
      '/auth/register',
      data: user.toMap(),
      headers: {"Authorization": ""},
    );
  }

  @override
  Future<List<UserModel>> listUsers() async {
    return Future.delayed(
      const Duration(seconds: 1),
      () => [
        UserModel(
          name: "David",
          lastName: "H",
          cpf: "48121457",
          complement: "casa",
          login: "david_nine",
          number: "547",
          password: "dsandsnvsda",
          phone: "74945471256",
          userPhotoUrl: "74945471256",
        )
      ],
    );
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
