import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tcc_frontend/src/modules/user_registration/data/models/image_id_model.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/user_model.dart';

abstract class IUserRepository {
  Future<Either<Failure, Unit>> createUser(UserModel model);
  Future<Either<Failure, List<UserModel>>> listUsers();
  Future<Either<Failure, ImageIdModel>> uploadPhoto(XFile photo);
}
