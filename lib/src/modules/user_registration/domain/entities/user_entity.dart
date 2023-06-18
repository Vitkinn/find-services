class UserEntity {
  final String? fullname;
  final String? login;
  final String? password;
  final String? cpf;
  final String? number;
  final String? complement;
  final String? phone;

  UserEntity({
    this.fullname,
    this.login,
    this.password,
    this.cpf,
    this.number,
    this.complement,
    this.phone,
  });

  UserEntity copyWith({
    String? fullname,
    String? login,
    String? password,
    String? cpf,
    String? number,
    String? complement,
    String? phone,
  }) {
    return UserEntity(
      cpf: cpf ?? this.cpf,
      complement: complement ?? this.complement,
      fullname: fullname ?? this.fullname,
      login: login ?? this.login,
      number: number ?? this.number,
      password: password ?? this.password,
      phone: phone ?? this.phone,
    );
  }
}
