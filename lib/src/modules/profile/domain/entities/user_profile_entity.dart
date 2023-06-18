class UserProfileEntity {
  final String? name;
  final String? lastName;
  final String? photoUrl;
  final DateTime? createAccountDate;

  UserProfileEntity({
    this.name,
    this.lastName,
    this.photoUrl,
    this.createAccountDate,
  });

  UserProfileEntity copyWith({
    String? name,
    String? lastName,
    String? photoUrl,
    DateTime? createAccountDate,
  }) {
    return UserProfileEntity(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      createAccountDate: createAccountDate ?? this.createAccountDate,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }
}
