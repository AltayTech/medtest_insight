import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import '../../business/entities/scan_entity.dart';

class ScanModel extends ScanEntity {
  const ScanModel({
    int id = 0,
    required ImageProvider image,
    required XFile imageSource,
  }) : super(
          id: id,
          image: image,
          imageSource: imageSource,
        );

  factory ScanModel.fromJson({required Map<String, dynamic> json}) {
    return ScanModel(
        id: json['id'], image: json['image'], imageSource: json['imageSource']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'image': imageSource,
    };
  }
}
