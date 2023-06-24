class UserEntity {
  final String? name;
  final String? lastName;
  final String? login;
  final String? password;
  final String? cpf;
  final String? number;
  final String? complement;
  final String? phone;
  final String? userPhotoUrl;

  UserEntity({
    this.name,
    this.lastName,
    this.login,
    this.password,
    this.cpf,
    this.number,
    this.complement,
    this.phone,
    this.userPhotoUrl,
  });

  UserEntity copyWith({
    String? name,
    String? lastName,
    String? login,
    String? password,
    String? cpf,
    String? number,
    String? complement,
    String? phone,
    String? userPhotoUrl,
  }) {
    return UserEntity(
      cpf: cpf ?? this.cpf,
      complement: complement ?? this.complement,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      login: login ?? this.login,
      number: number ?? this.number,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      userPhotoUrl: userPhotoUrl ?? this.userPhotoUrl,
    );
  }
}
