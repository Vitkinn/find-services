import 'package:findservices/src/modules/profile/domain/entities/user_profile_entity.dart';

class ServicesEntity {
  final int? rate;
  final int? quantity;
  final List<EvaluationEntity>? evaluations;
  final DateTime? evaluationDate;

  ServicesEntity({
    this.rate,
    this.quantity,
    this.evaluations,
    this.evaluationDate,
  });
}

class EvaluationEntity {
  final UserProfileEntity? user;
  final String? comment;
  final int? rate;
  final DateTime? evaluationDate;

  EvaluationEntity({
    this.user,
    this.comment,
    this.rate,
    this.evaluationDate,
  });
}
