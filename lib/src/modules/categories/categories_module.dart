import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/categories/presentation/pages/categories_page.dart';
import 'package:tcc_frontend/src/modules/home/presentation/controllers/home_controller.dart';

class CategoriesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/categories', child: (context, args) => CategoriesPage()),
      ];
}
