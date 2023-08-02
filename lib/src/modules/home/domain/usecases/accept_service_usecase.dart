import 'package:dartz/dartz.dart';
import 'package:findservices/src/core/errors/failure.dart';
import 'package:findservices/src/modules/home/domain/repositories/i_service_page_repository.dart';

abstract class IAcceptServiceUsecase {
  Future<Either<Failure, void>> call(String serviceId);
}

class AcceptServiceUsecase extends IAcceptServiceUsecase {
  final IServicePageRepository repository;

  AcceptServiceUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(String serviceId) async {
    return repository.acceptService(serviceId);
  }
}
