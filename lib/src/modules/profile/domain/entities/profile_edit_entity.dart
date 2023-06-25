class ProfileEditEntity {
  final String? name;
  final String? lastName;
  final String? photoUrl;
  final String? phone;
  final String? cpf;
  final String? login;
  final String? cnpj;
  final String? description;
  final String? category;
  final List<String>? actuationCities;

  ProfileEditEntity({
    this.name,
    this.lastName,
    this.photoUrl,
    this.phone,
    this.cpf,
    this.login,
    this.cnpj,
    this.description,
    this.category,
    this.actuationCities,
  });

  ProfileEditEntity copyWith({
    String? name,
    String? lastName,
    String? photoUrl,
    String? phone,
    String? cpf,
    String? login,
    String? cnpj,
    String? description,
    String? category,
    List<String>? actuationCities,
  }) {
    return ProfileEditEntity(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      photoUrl: photoUrl ?? this.photoUrl,
      phone: phone ?? this.phone,
      cpf: cpf ?? this.cpf,
      login: login ?? this.login,
      cnpj: cnpj ?? this.cnpj,
      description: description ?? this.description,
      category: category ?? this.category,
      actuationCities: actuationCities ?? this.actuationCities,
    );
  }
}
