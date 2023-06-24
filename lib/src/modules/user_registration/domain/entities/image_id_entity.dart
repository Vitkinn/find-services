class ImageIdEntity {
  final String imageId;

  ImageIdEntity({
    required this.imageId,
  });

  ImageIdEntity copyWith({
    String? imageId,
  }) {
    return ImageIdEntity(
      imageId: imageId ?? this.imageId,
    );
  }
}
