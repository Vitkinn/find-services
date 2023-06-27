import 'package:dartz/dartz.dart';
import 'package:tcc_frontend/src/core/errors/failure.dart';
import 'package:tcc_frontend/src/modules/home/data/datasource/i_service_page_datasource.dart';
import 'package:tcc_frontend/src/modules/home/data/models/service_list_model.dart';
import 'package:tcc_frontend/src/modules/home/domain/repositories/i_service_page_repository.dart';

class ServicePageRepository extends IServicePageRepository {
  final IServicesPageDatasource datasource;

  ServicePageRepository({required this.datasource});

  @override
  Future<Either<Failure, ServicesModel>> findServices() async {
    try {
      final result = await datasource.findServiceSolicitations();

      return right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnhandledFailure());
    }
  }
}
