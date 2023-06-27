import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/home/data/datasource/remote/home_page_datasource.dart';
import 'package:tcc_frontend/src/modules/home/data/repositories/home_page_repository.dart';
import 'package:tcc_frontend/src/modules/home/domain/usecases/load_service_providers_usecase.dart';
import 'package:tcc_frontend/src/modules/home/presentation/controllers/home_controller.dart';
import 'package:tcc_frontend/src/modules/home/presentation/pages/home_page.dart';
import 'package:tcc_frontend/src/modules/home/presentation/pages/service_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomePageDatasource(restClient: i.get())),
        Bind.lazySingleton((i) => HomePageRepository(datasource: i.get())),
        Bind.lazySingleton((i) => LoadServiceProviderUsecase(repository: i.get())),
        Bind.lazySingleton((i) => HomeController(
              loadServiceProviderUsecase: i.get(),
              getCategoryByKeyUsecase: i.get(),
            )),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/home', child: (context, args) => const HomePage()),
        ChildRoute('/services', child: (context, args) => const ServicesPage()),
      ];
}
