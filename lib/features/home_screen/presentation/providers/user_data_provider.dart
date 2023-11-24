import 'package:flutter/material.dart';
import 'package:medtest_insight/core/params/params.dart';
import 'package:medtest_insight/features/athentication_feature/business/entities/user_entity.dart';

import '../../../../../core/errors/failure.dart';

class UserDataProvider extends ChangeNotifier {
  UserEntity? user;
  AuthParam? loginSituation;
  Failure? failure;

  UserDataProvider({
    this.user,
    this.failure,
  });

// Future<void> eitherFailureOrRegister(String email, String password) async {
//   AuthRepositoryImpl repository = AuthRepositoryImpl(
//     UserlocalDataSource: UserLocalDataSourceImpl(
//       sharedPreferences: await SharedPreferences.getInstance(),
//     ),
//     networkInfo: NetworkInfoImpl(
//       DataConnectionChecker(),
//     ),
//     userRemoteDataSource: UserRemoteDataSource(),
//   );
//
//   final failureOrRegister =
//       await GetRegisterUseCase(authRepository: repository)
//           .call(email, password);
//
//   failureOrRegister.fold(
//     (Failure newFailure) {
//       user = null;
//       failure = newFailure;
//       notifyListeners();
//     },
//     (UserEntity newUser) {
//       user = newUser;
//       failure = null;
//       notifyListeners();
//     },
//   );
// }
//
// Future<void> eitherFailureOrLogout() async {
//   AuthRepositoryImpl repository = AuthRepositoryImpl(
//     UserlocalDataSource: UserLocalDataSourceImpl(
//       sharedPreferences: await SharedPreferences.getInstance(),
//     ),
//     networkInfo: NetworkInfoImpl(
//       DataConnectionChecker(),
//     ),
//     userRemoteDataSource: UserRemoteDataSource(),
//   );
//
//   final failureOrLogout =
//       await GetLogoutUseCase(authRepository: repository).call();
//
//   failureOrLogout.fold(
//     (Failure newFailure) {
//       user = null;
//       failure = newFailure;
//       notifyListeners();
//     },
//     (AuthParam newUser) {
//       loginSituation = newUser;
//       failure = null;
//       notifyListeners();
//     },
//   );
// }
//
// Future<void> eitherFailureOrLogin(String email, String password) async {
//   AuthRepositoryImpl repository = AuthRepositoryImpl(
//     UserlocalDataSource: UserLocalDataSourceImpl(
//       sharedPreferences: await SharedPreferences.getInstance(),
//     ),
//     networkInfo: NetworkInfoImpl(
//       DataConnectionChecker(),
//     ),
//     userRemoteDataSource: UserRemoteDataSource(),
//   );
//
//   final failureOrLogin =
//       await GetLoginUseCase(authRepository: repository).call(email, password);
//
//   failureOrLogin.fold(
//     (Failure newFailure) {
//       user = null;
//       failure = newFailure;
//       notifyListeners();
//     },
//     (AuthParam newUser) {
//       loginSituation = newUser;
//       failure = null;
//       notifyListeners();
//     },
//   );
// }
}
