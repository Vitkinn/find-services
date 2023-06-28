import 'package:image_picker/image_picker.dart';
import 'package:tcc_frontend/src/modules/user_registration/data/models/image_id_model.dart';
import 'package:tcc_frontend/src/modules/user_registration/data/models/user_model.dart';

abstract class IUserDatasource {
  Future<void> createUser(UserModel user);
  Future<List<UserModel>> listUsers();
  Future<ImageIdModel> uploadPhoto(XFile photo);
}
