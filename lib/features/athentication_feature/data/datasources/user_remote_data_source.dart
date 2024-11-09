import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meditest/core/params/params.dart';
import 'package:meditest/features/athentication_feature/business/entities/user_entity.dart';
import 'package:meditest/features/athentication_feature/data/models/user_model.dart';

import '../../../../../core/errors/exceptions.dart';

class UserRemoteDataSource {
  final Dio dio = Dio();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserModel> getRegister({required UserEntity userRegister}) async {
    try {
      UserCredential userCredintial = await auth.createUserWithEmailAndPassword(
        email: userRegister.email,
        password: userRegister.password,
      );
      return UserModel(
          email: userRegister.email, password: userRegister.password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
      throw ServerException();
    } catch (e) {
      debugPrint(e.toString());
      throw ServerException();
    }
  }

  Future<AuthParam> getLogin({required UserEntity userLogin}) async {
    try {
      debugPrint('Start Logged in');

      UserCredential userCredintial = await auth.signInWithEmailAndPassword(
        email: userLogin.email,
        password: userLogin.password,
      );
      debugPrint('Logged in');

      return AuthParam(situation: 'Logged in');
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message.toString());
      debugPrint('Not Logged in');

      throw ServerException();
    } catch (e) {
      debugPrint(e.toString());
      debugPrint('Not Logged in2222');

      throw ServerException();
    }
  }

  Future<AuthParam> logout() async {
    try {
      await auth.signOut();

      return AuthParam(situation: 'done');
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      throw ServerException();
    } catch (e) {
      debugPrint(e.toString());
      throw ServerException();
    }
  }
}
