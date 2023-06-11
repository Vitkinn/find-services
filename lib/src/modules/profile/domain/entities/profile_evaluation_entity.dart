import 'package:tcc_frontend/src/modules/profile/domain/entities/user_profile_entity.dart';

class ProfileEvaluationEntity {
  final double? rate;
  final int? quantity;
  final List<EvaluationEntity>? evaluations;

  ProfileEvaluationEntity({
    this.rate,
    this.quantity,
    this.evaluations,
  });
}

class EvaluationEntity {
  final UserProfileEntity? user;
  final String? message;
  final int? rate;

  EvaluationEntity({
    this.user,
    this.message,
    this.rate,
  });
}
