import 'package:flutter_modular/flutter_modular.dart';
import 'modules/home/home_module.dart';
import 'modules/profile/profile_module.dart';
import 'modules/login/login_module.dart';
import 'modules/user_registration/user_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: LoginModule()),
        // ModuleRoute(Modular.initialRoute, module: HomeModule()),
        // ModuleRoute(Modular.initialRoute, module: UserModule()),
        // ModuleRoute(Modular.initialRoute, module: ProfileModule()),
      ];
}
