import 'package:flutter_modular/flutter_modular.dart';
import 'package:findservices/src/modules/service_requests/data/datasource/remote/service_request_datasource.dart';
import 'package:findservices/src/modules/service_requests/data/repositories/service_request_repository.dart';
import 'package:findservices/src/modules/service_requests/domain/usecases/request_service_usecase.dart';
import 'package:findservices/src/modules/service_requests/presentation/controllers/form_service_controller.dart';
import 'package:findservices/src/modules/service_requests/presentation/pages/request_service_page.dart';

class ServiceRequestModule extends Module {
  @override
  List<Bind> get binds => [
        // Datasource
        Bind.lazySingleton(
            (i) => ServiceRequestDatasource(restClient: i.get())),
        Bind.lazySingleton(
            (i) => ServiceRequestRepository(datasource: i.get())),
        Bind.lazySingleton((i) => RequestServiceUsecase(repository: i.get())),
        Bind.lazySingleton(
            (i) => RequestServiceController(requestServiceUsecase: i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/request_service', child: (_, args) => FormServicePage()),
      ];
}
