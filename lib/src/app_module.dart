import 'package:flutter_modular/flutter_modular.dart';
import 'package:findservices/src/core/rest_client/dio/dio_rest_client.dart';
import 'package:findservices/src/core/rest_client/rest_client.dart';
import 'package:findservices/src/modules/home/home_module.dart';
import 'package:findservices/src/modules/profile/profile_module.dart';
import 'package:findservices/src/modules/service_requests/service_request_module.dart';
import 'package:findservices/src/modules/shared/shared_module.dart';
import 'package:findservices/src/modules/user_registration/user_module.dart';
import 'package:findservices/src/modules/categories/categories_module.dart';

import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [SharedModule()];

  @override
  List<Bind> get binds => [
        Bind.singleton<RestClient>(
            (i) => DioRestClient(authController: i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: LoginModule()),
        ModuleRoute(Modular.initialRoute, module: UserModule()),
        ModuleRoute(Modular.initialRoute, module: HomeModule()),
        ModuleRoute(Modular.initialRoute, module: ProfileModule()),
        ModuleRoute(Modular.initialRoute, module: SharedModule()),
        ModuleRoute(Modular.initialRoute, module: CategoriesModule()),
        ModuleRoute(Modular.initialRoute, module: ServiceRequestModule()),
      ];
}
