enum RequestStatusType {
  pendingServiceAccept('PENDING_SERVICE_ACCEPT'),
  pendingClientApproved('PENDING_CLIENT_APPROVED'),
  approved('APPROVED'),
  canceled('CANCELED'),
  serviceRejected('SERVICE_REJECTED'),
  done('DONE');

  final String role;
  const RequestStatusType(this.role);

  static RequestStatusType? valueOf(String requestStatusName) {
    return null;
  }
}
