import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/login/presentation/login_page.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const LoginPage()),
      ];
}
