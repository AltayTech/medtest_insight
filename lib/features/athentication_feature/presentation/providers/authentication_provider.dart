import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:meditest/core/params/params.dart';
import 'package:meditest/features/athentication_feature/business/entities/user_entity.dart';
import 'package:meditest/features/athentication_feature/business/usecases/get_login_usecase.dart';
import 'package:meditest/features/athentication_feature/business/usecases/get_logout_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../core/connection/network_info.dart';
import '../../business/usecases/get_register_usecase.dart';
import '../../data/datasources/user_local_data_source.dart';
import '../../data/datasources/user_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';

class AuthenticationProvider extends ChangeNotifier {
  UserEntity? user;
  AuthParam? loginSituation;
  Failure? failure;

  AuthenticationProvider({
    this.user,
    this.failure,
  });

  Future<void> eitherFailureOrRegister(String email, String password) async {
    AuthRepositoryImpl repository = AuthRepositoryImpl(
      UserlocalDataSource: UserLocalDataSourceImpl(
        sharedPreferences: await SharedPreferences.getInstance(),
      ),
      networkInfo: NetworkInfoImpl(
        DataConnectionChecker(),
      ),
      userRemoteDataSource: UserRemoteDataSource(),
    );

    final failureOrRegister =
        await GetRegisterUseCase(authRepository: repository)
            .call(email, password);

    failureOrRegister.fold(
      (Failure newFailure) {
        user = null;
        failure = newFailure;
        notifyListeners();
      },
      (UserEntity newUser) {
        user = newUser;
        failure = null;
        notifyListeners();
      },
    );
  }

  Future<void> eitherFailureOrLogout() async {
    AuthRepositoryImpl repository = AuthRepositoryImpl(
      UserlocalDataSource: UserLocalDataSourceImpl(
        sharedPreferences: await SharedPreferences.getInstance(),
      ),
      networkInfo: NetworkInfoImpl(
        DataConnectionChecker(),
      ),
      userRemoteDataSource: UserRemoteDataSource(),
    );

    final failureOrLogout =
        await GetLogoutUseCase(authRepository: repository).call();

    failureOrLogout.fold(
      (Failure newFailure) {
        user = null;
        failure = newFailure;
        notifyListeners();
      },
      (AuthParam newUser) {
        loginSituation = newUser;
        failure = null;
        notifyListeners();
      },
    );
  }

  Future<void> eitherFailureOrLogin(String email, String password) async {
    AuthRepositoryImpl repository = AuthRepositoryImpl(
      UserlocalDataSource: UserLocalDataSourceImpl(
        sharedPreferences: await SharedPreferences.getInstance(),
      ),
      networkInfo: NetworkInfoImpl(
        DataConnectionChecker(),
      ),
      userRemoteDataSource: UserRemoteDataSource(),
    );

    final failureOrLogin =
        await GetLoginUseCase(authRepository: repository).call(email, password);

    failureOrLogin.fold(
      (Failure newFailure) {
        user = null;
        failure = newFailure;
        notifyListeners();
      },
      (AuthParam newUser) {
        loginSituation = newUser;
        failure = null;
        notifyListeners();
      },
    );
  }
}
