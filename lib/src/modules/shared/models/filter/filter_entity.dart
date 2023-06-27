class FilterEntity {
  final String? name;
  final String? category;
  final String? city;

  FilterEntity({
    this.name,
    this.category,
    this.city,
  });

  FilterEntity copyWith({
    String? name,
    String? category,
    String? city,
  }) {
    return FilterEntity(
      name: name ?? this.name,
      category: category,
      city: city ?? this.city,
    );
  }
}
