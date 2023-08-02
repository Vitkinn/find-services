import 'package:findservices/src/modules/home/domain/entities/evaluate_service_entity.dart';

class EvaluateServiceModel extends EvaluateServiceEntity {
  EvaluateServiceModel({
    required super.value,
    required super.valueJustification,
  });

  static EvaluateServiceModel fromMap(Map<String, dynamic> map) {
    return EvaluateServiceModel(
      value: map["value"],
      valueJustification: map["valueJustification"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "value": value,
      "valueJustification": valueJustification,
    };
  }

  static EvaluateServiceModel fromEntity(EvaluateServiceEntity entity) {
    return EvaluateServiceModel(
      value: entity.value,
      valueJustification: entity.valueJustification,
    );
  }
}
