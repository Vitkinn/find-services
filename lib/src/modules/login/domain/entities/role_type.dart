enum RoleType {
  client('CLIENT'),
  serviceProvider('SERVICE_PROVIDER'),
  admin('ADMIN');

  final String role;
  const RoleType(this.role);

  static RoleType? valueOf(String roleTypeName) {
    return values.firstWhere((type) => type.role == roleTypeName, orElse: () => RoleType.client);
  }
}
