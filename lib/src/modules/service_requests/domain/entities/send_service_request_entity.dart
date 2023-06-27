class SendServiceRequestEntity {
  String? serviceDescription;
  double? clientWishValue;
  String? serviceProviderId;

  SendServiceRequestEntity({
    this.serviceDescription,
    this.clientWishValue,
    this.serviceProviderId,
  });

  SendServiceRequestEntity copyWith({
    String? id,
    String? serviceDescription,
    double? clientWishValue,
    String? serviceProviderId,
  }) {
    return SendServiceRequestEntity(
      serviceDescription: serviceDescription ?? this.serviceDescription,
      clientWishValue: clientWishValue ?? this.clientWishValue,
      serviceProviderId: serviceProviderId ?? this.serviceProviderId,
    );
  }
}
