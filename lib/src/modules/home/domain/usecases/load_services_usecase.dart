import 'package:dartz/dartz.dart';
import 'package:tcc_frontend/src/core/errors/failure.dart';
import 'package:tcc_frontend/src/modules/home/data/models/service_list_model.dart';
import 'package:tcc_frontend/src/modules/home/domain/repositories/i_service_page_repository.dart';

abstract class ILoadServicesUsecase {
  Future<Either<Failure, List<ServiceModel>>> call();
}

class LoadServicesUsecase extends ILoadServicesUsecase {
  final IServicePageRepository repository;

  LoadServicesUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<ServiceModel>>> call() async {
    return repository.findServices();
  }
}
