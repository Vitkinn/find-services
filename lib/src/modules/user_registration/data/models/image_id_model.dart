import 'package:tcc_frontend/src/modules/user_registration/domain/entities/image_id_entity.dart';

class ImageIdModel extends ImageIdEntity {
  ImageIdModel({
    required super.imageId,
  });

  Map<String, dynamic> toMap() {
    return {
      "imageId": imageId,
    };
  }

  static ImageIdModel fromMap(Map<String, dynamic> map) {
    return ImageIdModel(
      imageId: map["imageId"],
    );
  }

  static ImageIdModel fromEntity(ImageIdEntity entity) {
    return ImageIdModel(
      imageId: entity.imageId,
    );
  }
}
