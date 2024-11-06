import 'package:medtest_insight/features/athentication_feature/business/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    int id = 0,
    String email = '',
    String password = '',
  }) : super(
          id: id,
          email: email,
          password: password,
        );

  factory UserModel.fromJson({required Map<String, dynamic> json}) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
    };
  }
}
