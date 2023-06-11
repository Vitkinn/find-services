import 'package:dio/dio.dart';
import 'package:tcc_frontend/src/modules/shared/controllers/i_auth_controller.dart';

class AuthInterceptor extends Interceptor {
  static const BARRER = 'barrer';

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
      return;
    } else {
      options.headers['barrer'] = _authController.getToken();
    }
    handler.next(options);
  }
}
