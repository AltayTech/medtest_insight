import 'package:image_picker/image_picker.dart';

class NoParams {}

class TemplateParams {}

class ScanParams {
  final int? id;
  final ImagePicker? image;

  ScanParams({
    required this.id,
    required this.image,
  });
}
