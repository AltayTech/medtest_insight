import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class ScanEntity {
  final int? id;
  final ImageProvider? image;
  final XFile imageSource;

  const ScanEntity({
    required this.id,
    required this.image,
    required this.imageSource,
  });
}
