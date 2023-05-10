import 'package:tcc_frontend/src/modules/user/data/models/user_model.dart';

abstract class IUserDatasource {
  Future<void> createUser(UserModel user);
  Future<List<UserModel>> listUsers();
}
