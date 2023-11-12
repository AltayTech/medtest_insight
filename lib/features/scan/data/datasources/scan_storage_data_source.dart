import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../business/entities/scan_entity.dart';
import '../models/scan_model.dart';

abstract class ScanStorageDataSource {
  Future<Either<Failure, ScanEntity>> getScan({required ImageSource imageSource});
}

class ScanStorageDataSourceImpl implements ScanStorageDataSource {
  final ImagePicker imagePicker;

  ScanStorageDataSourceImpl({required this.imagePicker});

  @override
  Future<Either<Failure, ScanModel>> getScan({required ImageSource imageSource}) async {
    bool picked = true;
    final image = await imagePicker
        .pickImage(
      source: imageSource,
    )
        .onError((error, stackTrace) {
      picked = false;

      throw ServerException();
    }).catchError((obejct, trace) {
      picked = false;
    });
    if (image == null) {
      picked = false;
    }

    if (picked) {
      debugPrint(picked.toString());
      debugPrint('image!.path.toString()');
      debugPrint(image!.path.toString());
      return Right(ScanModel(image: FileImage(File(image.path)))) ;
    } else {
      return  Left(CacheFailure(errorMessage: 'Image picking is canceled'));
    }
  }
}
