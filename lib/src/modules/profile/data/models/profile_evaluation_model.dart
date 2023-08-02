import 'package:findservices/src/modules/profile/data/models/user_profile_model.dart';
import 'package:findservices/src/modules/profile/domain/entities/profile_evaluation_entity.dart';

class ProfileEvaluationModel extends ServicesEntity {
  ProfileEvaluationModel({
    required super.rate,
    required super.quantity,
    required super.evaluations,
    required super.evaluationDate,
  });

  static ProfileEvaluationModel fromMap(Map<String, dynamic> map) {
    List evaluations = map["evaluations"];
    List<EvaluationModel> mapedEvaluations = evaluations
        .map((evaluation) => EvaluationModel.fromMap(evaluation))
        .toList();

    return ProfileEvaluationModel(
      rate: map["rate"],
      quantity: map["quantity"],
      evaluationDate: map["evaluationDate"],
      evaluations: mapedEvaluations,
    );
  }
}

class EvaluationModel extends EvaluationEntity {
  EvaluationModel({
    required super.rate,
    required super.comment,
    required super.user,
    required super.evaluationDate,
  });

  static EvaluationModel fromMap(Map<String, dynamic> map) {
    UserProfileModel user = UserProfileModel.fromMap(map["evaluatorUser"]);

    return EvaluationModel(
      rate: map["rate"],
      comment: map["comment"],
      user: user,
      evaluationDate: DateTime.parse(map['evaluationDate']),
    );
  }
}
