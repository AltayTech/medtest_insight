import 'package:image_picker/image_picker.dart';

class ScanEntity {
  final int? id;
  final ImagePicker? image;
  const ScanEntity({
    required this.id,
    required this.image,
  });
}
