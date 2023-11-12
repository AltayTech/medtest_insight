import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/errors/exceptions.dart';
import '../models/scan_model.dart';

abstract class ScanStorageDataSource {
  Future<ScanModel> getScan({required ImageSource imageSource});
}

class ScanStorageDataSourceImpl implements ScanStorageDataSource {
  final ImagePicker imagePicker;

  ScanStorageDataSourceImpl({required this.imagePicker});

  @override
  Future<ScanModel> getScan({required ImageSource imageSource}) async {
    bool picked = true;
    final image = await imagePicker
        .pickImage(
      source: imageSource,
    )
        .onError((error, stackTrace) {
      picked = false;

      throw ServerException();
    });

    if (picked) {
      debugPrint('image!.path.toString()');
      debugPrint(image!.path.toString());
      return ScanModel(image: AssetImage(image.path));
    } else {
      return ScanModel(image: AssetImage(image!.path));
    }
  }
}
