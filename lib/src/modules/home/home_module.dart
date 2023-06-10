import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/user_registration/data/datasource/i_user_datasource.dart';
import 'package:tcc_frontend/src/modules/user_registration/domain/repositories/i_user_repository.dart';
import 'package:tcc_frontend/src/modules/home/presentation/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/home', child: (context, args) => const HomePage()),
      ];
}
