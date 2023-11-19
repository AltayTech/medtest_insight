import 'package:medtest_insight/features/athentication_feature/business/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    int id = 0,
    String text = '',
  }) : super(
          id: id,
          text: text,
        );

  factory UserModel.fromJson({required Map<String, dynamic> json}) {
    return UserModel(
      id: json['id'],
      text: json['result'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'result': text,
    };
  }
}
