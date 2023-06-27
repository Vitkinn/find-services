import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/categories/presentation/controller/categories_controller.dart';
import 'package:tcc_frontend/src/modules/categories/presentation/pages/categories_page.dart';

class CategoriesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => CategoriesController(getCategoriesUseCase: i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/categories', child: (context, args) => const CategoriesPage()),
      ];
}
