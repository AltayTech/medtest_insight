import 'package:image_picker/image_picker.dart';

import '../../business/entities/scan_entity.dart';

class ScanModel extends ScanEntity {
  const ScanModel({
    required int id,
    required ImagePicker image,
  }) : super(
          id: id,
          image: image,
        );

  factory ScanModel.fromJson({required Map<String, dynamic> json}) {
    return ScanModel(id: json['id'], image: json['image']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
    };
  }
}
