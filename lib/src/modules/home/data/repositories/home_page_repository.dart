import 'package:dartz/dartz.dart';
import 'package:findservices/src/core/errors/failure.dart';
import 'package:findservices/src/modules/home/data/datasource/i_home_page_datasource.dart';
import 'package:findservices/src/modules/home/data/models/service_provider_list_model.dart';
import 'package:findservices/src/modules/home/domain/repositories/i_home_page_repository.dart';
import 'package:findservices/src/modules/shared/models/filter/filter_entity.dart';
import 'package:findservices/src/modules/shared/models/filter/filter_model.dart';

class HomePageRepository extends IHomePageRepository {
  final IHomePageDatasource datasource;

  HomePageRepository({required this.datasource});

  @override
  Future<Either<Failure, List<ServiceProviderModel>>> findServiceProfiles(
      FilterEntity filter) async {
    try {
      final result =
          await datasource.findServiceProviders(FilterModel.fromEntity(filter));

      return right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnhandledFailure());
    }
  }
}
