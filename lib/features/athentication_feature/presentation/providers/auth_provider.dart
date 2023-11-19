import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:medtest_insight/features/athentication_feature/business/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../core/connection/network_info.dart';
import '../../business/usecases/get_register_usecase.dart';
import '../../data/datasources/user_local_data_source.dart';
import '../../data/datasources/user_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';

class AuthProvider extends ChangeNotifier {
  UserEntity? user;
  Failure? failure;

  AuthProvider({
    this.user,
    this.failure,
  });

  void eitherFailureOrRegister(String email, String password) async {
    AuthRepositoryImpl repository = AuthRepositoryImpl(
      localDataSource: UserLocalDataSourceImpl(
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

// void eitherFailureOrAnalyse(GetAnalyseUseCase getAnalyseUseCase) async {
//   final failureOrScan = await getAnalyseUseCase.call(scan!);
//
//   failureOrScan.fold(
//     (Failure newFailure) {
//       analyseResult = null;
//       failure = newFailure;
//       notifyListeners();
//     },
//     (AnalyseEntity newScan) {
//       analyseResult = newScan;
//       failure = null;
//       notifyListeners();
//     },
//   );
// }

// void eitherFailureOrRecommendation(
//     GetRecommendationUseCase getRecommendationUseCase) async {
//   final failureOrScan = await getRecommendationUseCase.call(analyseResult!);
//
//   failureOrScan.fold(
//     (Failure newFailure) {
//       analyseResult = null;
//       failure = newFailure;
//       notifyListeners();
//     },
//     (RecommendationEntity newScan) {
//       recommendationEntity = newScan;
//       failure = null;
//       notifyListeners();
//     },
//   );
// }
}
