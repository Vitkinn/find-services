import 'package:tcc_frontend/src/modules/shared/models/filter/filter_entity.dart';

class FilterModel extends FilterEntity {
  FilterModel({
    required super.name,
    required super.category,
    required super.city,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "category": category,
      "city": city,
    };
  }

  static FilterModel fromMap(Map<String, dynamic> map) {
    return FilterModel(
      name: map["name"],
      category: map["category"],
      city: map["city"],
    );
  }

  static FilterModel fromEntity(FilterEntity entity) {
    return FilterModel(
      name: entity.name,
      category: entity.category,
      city: entity.city,
    );
  }
}
