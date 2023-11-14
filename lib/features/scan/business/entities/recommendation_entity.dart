import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class RecommendationEntity {
  final int? id;
  final String result;

  const RecommendationEntity({
    required this.id,
    required this.result,
  });
}
