class UserProfileEntity {
  final String? name;
  final String? lastName;
  final String? photoUrl;

  UserProfileEntity({
    this.name,
    this.lastName,
    this.photoUrl,
  });

  UserProfileEntity copyWith({
    String? name,
    String? lastName,
    String? photoUrl,
  }) {
    return UserProfileEntity(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }
}
