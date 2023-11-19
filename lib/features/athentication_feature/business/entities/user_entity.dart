import 'package:flutter/widgets.dart';

class UserEntity {
  final int? id;
  final String email;
  final String password;

  const UserEntity({
    required this.id,
    required this.email,
    required this.password,
  });
}
