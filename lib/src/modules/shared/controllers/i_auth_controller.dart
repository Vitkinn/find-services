import 'package:tcc_frontend/src/modules/login/domain/entities/loged_user_entity.dart';

abstract class IAuthController {
  void login(LogedUserEntity user);
  void logount();
  String? getToken();
  bool isAuthenticated();
  String getCurrentUserId();
  LogedUserEntity getCurrentUser();
  void toServiceProvider();
}
