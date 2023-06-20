class ProfileEditEntity {
  final String? name;
  final String? lastName;
  final String? photoUrl;
  final String? phone;
  final String? cpf;
  final String? login;

  ProfileEditEntity({
    this.name,
    this.lastName,
    this.photoUrl,
    this.phone,
    this.cpf,
    this.login,
  });

  ProfileEditEntity copyWith({
    String? name,
    String? lastName,
    String? photoUrl,
    String? phone,
    String? cpf,
    String? login,
  }) {
    return ProfileEditEntity(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      photoUrl: photoUrl ?? this.photoUrl,
      phone: phone ?? this.phone,
      cpf: cpf ?? this.cpf,
      login: login ?? this.login,
    );
  }
}
