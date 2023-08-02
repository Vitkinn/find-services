import 'package:findservices/src/modules/login/data/models/loged_user_model.dart';
import 'package:findservices/src/modules/login/data/models/login_model.dart';

abstract class ILoginDatasource {
  Future<LogedUserModel> login(LoginModel login);
}
