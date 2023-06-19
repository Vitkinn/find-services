class LoginEntity {
  final String? username;
  final String? password;

  LoginEntity({
    this.username,
    this.password,
  });

  LoginEntity copyWith({
    String? username,
    String? password,
  }) {
    return LoginEntity(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
