class LoginEntity {
  final String? login;
  final String? password;

  LoginEntity({
    this.login,
    this.password,
  });

  LoginEntity copyWith({
    String? login,
    String? password,
  }) {
    return LoginEntity(
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }
}
