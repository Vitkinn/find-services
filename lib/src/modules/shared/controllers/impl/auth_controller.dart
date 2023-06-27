import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/login/domain/entities/loged_user_entity.dart';
import 'package:tcc_frontend/src/modules/login/domain/entities/role_type.dart';
import 'package:tcc_frontend/src/modules/shared/controllers/i_auth_controller.dart';
import 'package:tcc_frontend/src/modules/user_registration/domain/entities/user_entity.dart';

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

  @override
  void logount() {
    currentUser = null;
    Modular.to.navigate('/');
  }

  @override
  LogedUserEntity getCurrentUser() {
    return currentUser!;
  }

  @override
  void toServiceProvider() {
    currentUser = currentUser!.copyWith(role: RoleType.serviceProvider);
  }

  @override
  void update(UserEntity user) {
    currentUser = currentUser!.copyWith(
      username: '${user.name} ${user.lastName}',
      login: user.login,
    );
  }
}
