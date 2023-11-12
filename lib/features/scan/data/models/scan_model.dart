import 'package:flutter/widgets.dart';

import '../../business/entities/scan_entity.dart';

class ScanModel extends ScanEntity {
  const ScanModel({
     int id=0,
    required ImageProvider image,
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
