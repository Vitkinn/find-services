import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/categories/presentation/pages/categories_page.dart';

class CategoriesModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/categories', child: (context, args) => const CategoriesPage()),
      ];
}
