import 'package:flutter/widgets.dart';

class NoParams {}

class TemplateParams {}

class ScanParams {
  final int? id;
  final ImageProvider? image;

  ScanParams({
    required this.id,
    required this.image,
  });
}

class LogoutParam {
  final String? situation;

  LogoutParam({required this.situation});
}
