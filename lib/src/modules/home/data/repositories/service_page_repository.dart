import 'package:dartz/dartz.dart';
import 'package:tcc_frontend/src/core/errors/failure.dart';
import 'package:tcc_frontend/src/modules/home/data/datasource/i_service_page_datasource.dart';
import 'package:tcc_frontend/src/modules/home/data/models/evaluate_service_model.dart';
import 'package:tcc_frontend/src/modules/home/data/models/service_list_model.dart';
import 'package:tcc_frontend/src/modules/home/domain/entities/evaluate_service_entity.dart';
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

  @override
  Future<Either<Failure, ServiceModel>> evaluateServiceRequest(
      String serviceId, EvaluateServiceEntity entity) async {
    try {
      final result = await datasource.evaluateServiceRequest(
          serviceId, EvaluateServiceModel.fromEntity(entity));

      return right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnhandledFailure());
    }
  }

  @override
  Future<Either<Failure, void>> rejectService(String serviceId) async {
    try {
      await datasource.rejectService(serviceId);

      return right(null);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnhandledFailure());
    }
  }

  @override
  Future<Either<Failure, void>> cancelService(String serviceId) async {
    try {
      await datasource.cancelService(serviceId);

      return right(null);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnhandledFailure());
    }
  }

  @override
  Future<Either<Failure, void>> acceptService(String serviceId) async {
    try {
      await datasource.acceptService(serviceId);

      return right(null);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnhandledFailure());
    }
  }

  @override
  Future<Either<Failure, void>> finishService(String serviceId) async {
    try {
      await datasource.finishService(serviceId);

      return right(null);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnhandledFailure());
    }
  }
}
