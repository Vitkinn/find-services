import 'package:tcc_frontend/src/modules/profile/data/models/user_profile_model.dart';
import 'package:tcc_frontend/src/modules/profile/domain/entities/profile_evaluation_entity.dart';

class ProfileEvaluationModel extends ProfileEvaluationEntity {
  ProfileEvaluationModel({
    required super.rate,
    required super.quantity,
    required super.evaluations,
  });

  static ProfileEvaluationModel fromMap(Map<String, dynamic> map) {
    List<Map<String, dynamic>> evaluations = map["evaluations"];
    List<EvaluationModel> mapedEvaluations = evaluations
        .map((evaluation) => EvaluationModel.fromMap(evaluation))
        .toList();

    return ProfileEvaluationModel(
      rate: map["rate"],
      quantity: map["quantity"],
      evaluations: mapedEvaluations,
    );
  }
}

class EvaluationModel extends EvaluationEntity {
  EvaluationModel({
    required super.rate,
    required super.message,
    required super.user,
  });

  static EvaluationModel fromMap(Map<String, dynamic> map) {
    UserProfileModel user = UserProfileModel.fromMap(map["user"]);

    return EvaluationModel(
      rate: map["rate"],
      message: map["message"],
      user: user,
    );
  }
}
