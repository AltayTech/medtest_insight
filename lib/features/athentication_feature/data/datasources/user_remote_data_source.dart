import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:medtest_insight/features/athentication_feature/business/entities/user_entity.dart';
import 'package:medtest_insight/features/athentication_feature/data/models/user_model.dart';

import '../../../../../core/errors/exceptions.dart';

class UserRemoteDataSource {
  final Dio dio = Dio();
  final FirebaseAuth auth = FirebaseAuth.instance;

  String? apiKey = dotenv.env['TOKEN'];

  final String apiUrl = 'https://api.openai.com/v1/completions';

  // 'https://api.openai.com/v1/engines/davinci-codex/completions';

  Future<UserModel> getRegister(
      {required UserEntity userRegister}) async {
    debugPrint(apiKey);

    try {
      UserCredential userCredintial = await auth.createUserWithEmailAndPassword(
        email: userRegister.email,
        password: userRegister.password,
      );
      return UserModel(
          email: userRegister.email, password: userRegister.password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      throw ServerException();
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }
}
