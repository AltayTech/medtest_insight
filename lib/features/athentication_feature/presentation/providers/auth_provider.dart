import 'package:flutter/material.dart';
import 'package:medtest_insight/features/athentication_feature/business/entities/user_entity.dart';

import '../../../../../core/errors/failure.dart';

class ScanProvider extends ChangeNotifier {
  UserEntity? userEntity;
  Failure? failure;

  ScanProvider({
    this.userEntity,
    this.failure,
  });

// void eitherFailureOrScan() async {
//   ScanRepositoryImpl repository = ScanRepositoryImpl(
//     storageDataSource: ScanStorageDataSourceImpl(
//       imagePicker: ImagePicker(),
//     ),
//     localDataSource: ScanLocalDataSourceImpl(
//       sharedPreferences: await SharedPreferences.getInstance(),
//     ),
//     networkInfo: NetworkInfoImpl(
//       DataConnectionChecker(),
//     ),
//     scanRemoteDataSource: ScanRemoteDataSource(),
//   );
//
//   final failureOrScan = await GetScanUseCase(scanRepository: repository).call(
//       // scanParams: ScanParams(
//       //   id: repository.storageDataSource.,
//       //   image: scan!.image,
//       // ),
//       );
//
//   failureOrScan.fold(
//     (Failure newFailure) {
//       scan = null;
//       failure = newFailure;
//       notifyListeners();
//     },
//     (ScanEntity newScan) {
//       scan = newScan;
//       failure = null;
//       notifyListeners();
//     },
//   );
// }
//
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
//
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
