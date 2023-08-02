import 'package:dio/dio.dart';
import 'package:findservices/src/modules/shared/controllers/i_auth_controller.dart';

class AuthInterceptor extends Interceptor {
  static const BARRER = 'Authorization';

  late final IAuthController _authController;

  AuthInterceptor({required IAuthController authController})
      : _authController = authController;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    if (options.headers.containsKey(BARRER)) {
      options.headers.remove(BARRER);
    } else {
      options.headers
          .addAll({'Authorization': 'Bearer ${_authController.getToken()}'});
    }
    handler.next(options);
  }
}
