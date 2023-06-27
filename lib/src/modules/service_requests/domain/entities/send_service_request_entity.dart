class SendServiceRequestEntity {
  String? serviceDescription;
  double? clientWishValue;
  String? serviceProviderId;
  String? title;

  SendServiceRequestEntity({
    this.serviceDescription,
    this.clientWishValue,
    this.serviceProviderId,
    this.title,
  });

  SendServiceRequestEntity copyWith({
    String? serviceDescription,
    double? clientWishValue,
    String? serviceProviderId,
    String? title,
  }) {
    return SendServiceRequestEntity(
      serviceDescription: serviceDescription ?? this.serviceDescription,
      title: title ?? this.title,
      clientWishValue: clientWishValue ?? this.clientWishValue,
      serviceProviderId: serviceProviderId ?? this.serviceProviderId,
    );
  }
}
