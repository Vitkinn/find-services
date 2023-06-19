import 'package:tcc_frontend/src/modules/login/domain/entities/loged_user_entity.dart';
import 'package:tcc_frontend/src/modules/shared/controllers/i_auth_controller.dart';

class AuthController extends IAuthController {
  LogedUserEntity? currentUser;

  @override
  void login(LogedUserEntity user) {
    currentUser = user;
  }

  @override
  String? getToken() {
    if (isAuthenticated()) {
      return currentUser!.accessToken!;
    }
    currentUser = null;
    return null;
  }

  @override
  String getCurrentUserId() {
    return currentUser!.id!;
  }

  @override
  bool isAuthenticated() {
    return currentUser != null && currentUser!.expiration!.isAfter(DateTime.now());
  }
}
