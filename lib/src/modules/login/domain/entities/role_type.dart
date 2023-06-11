enum RoleType {
  client('CLIENT'),
  serviceProvider('SERVICE_PROVIDER'),
  admin('ADMIN');

  final String role;
  const RoleType(this.role);
}
