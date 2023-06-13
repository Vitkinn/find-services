enum RoleType {
  client('CLIENT'),
  serviceProvider('SERVICE_PROVIDER'),
  admin('ADMIN');

  final String role;
  const RoleType(this.role);

  static RoleType? valueOf(String roleTypeName) {
    return values.firstWhere(
        (type) => type.toString().split(".").last == roleTypeName,
        orElse: () => RoleType.client);
  }
}
