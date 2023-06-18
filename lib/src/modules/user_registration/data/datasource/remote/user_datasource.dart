import 'package:tcc_frontend/src/core/rest_client/rest_client.dart';
import 'package:tcc_frontend/src/modules/user_registration/data/models/user_model.dart';

import '../i_user_datasource.dart';

class UserDatasource extends IUserDatasource {
  final RestClient restClient;

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
          fullname: "David",
          cpf: "48121457",
          complement: "casa",
          login: "david_nine",
          number: "547",
          password: "dsandsnvsda",
          phone: "74945471256",
        )
      ],
    );
  }
}
