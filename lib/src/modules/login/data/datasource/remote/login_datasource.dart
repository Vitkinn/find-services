import 'package:tcc_frontend/src/core/rest_client/rest_client.dart';
import 'package:tcc_frontend/src/modules/login/data/models/loged_user_model.dart';
import 'package:tcc_frontend/src/modules/login/data/models/login_model.dart';

import '../i_login_datasource.dart';

class LoginDatasource extends ILoginDatasource {
  final RestClient restClient;

  LoginDatasource({required this.restClient});

  @override
  Future<LogedUserModel> login(LoginModel login) async {
    final result = await restClient.post(
      '/auth/signin',
      data: login.toMap(),
      headers: {"Authorization": ""},
    );
    return LogedUserModel.fromMap(result.data);
  }
}
