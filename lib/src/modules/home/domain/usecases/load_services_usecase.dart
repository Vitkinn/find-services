import 'package:dartz/dartz.dart';
import 'package:findservices/src/core/errors/failure.dart';
import 'package:findservices/src/modules/home/data/models/service_list_model.dart';
import 'package:findservices/src/modules/home/domain/repositories/i_service_page_repository.dart';

abstract class ILoadServicesUsecase {
  Future<Either<Failure, ServicesModel>> call();
}

class LoadServicesUsecase extends ILoadServicesUsecase {
  final IServicePageRepository repository;

  LoadServicesUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, ServicesModel>> call() async {
    return repository.findServices();
  }
}
