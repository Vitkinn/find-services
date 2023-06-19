import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/core/rest_client/dio/dio_rest_client.dart';
import 'package:tcc_frontend/src/core/rest_client/rest_client.dart';
import 'package:tcc_frontend/src/modules/home/home_module.dart';
import 'package:tcc_frontend/src/modules/profile/profile_module.dart';
import 'package:tcc_frontend/src/modules/shared/shared_module.dart';
import 'package:tcc_frontend/src/modules/user_registration/user_module.dart';

import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [SharedModule()];

  @override
  List<Bind> get binds => [
        Bind.singleton<RestClient>((i) => DioRestClient(authController: i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: LoginModule()),
        ModuleRoute(Modular.initialRoute, module: UserModule()),
        ModuleRoute(Modular.initialRoute, module: HomeModule()),
        ModuleRoute(Modular.initialRoute, module: ProfileModule()),
      ];
}
