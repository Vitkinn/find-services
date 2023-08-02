import 'package:dartz/dartz.dart';
import 'package:findservices/src/core/errors/failure.dart';
import 'package:findservices/src/modules/home/domain/repositories/i_service_page_repository.dart';

abstract class ICancelServiceUsecase {
  Future<Either<Failure, void>> call(String serviceId);
}

class CancelServiceUsecase extends ICancelServiceUsecase {
  final IServicePageRepository repository;

  CancelServiceUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(String serviceId) async {
    return repository.cancelService(serviceId);
  }
}
