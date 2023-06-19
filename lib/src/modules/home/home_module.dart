import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/home/presentation/controllers/home_controller.dart';
import 'package:tcc_frontend/src/modules/home/presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/home', child: (context, args) => const HomePage()),
      ];
}
