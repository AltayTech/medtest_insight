import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medtest_insight/features/scan/business/entities/recommendation_entity.dart';
import 'package:medtest_insight/features/scan/business/usecases/get_analyse_usecase.dart';
import 'package:medtest_insight/features/scan/business/usecases/get_recommendation_usecase.dart';
import 'package:medtest_insight/features/scan/data/datasources/scan_remote_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/failure.dart';
import '../../business/entities/analyse_entity.dart';
import '../../business/entities/scan_entity.dart';
import '../../business/usecases/get_scan_usecase.dart';
import '../../data/datasources/scan_local_data_source.dart';
import '../../data/datasources/scan_storage_data_source.dart';
import '../../data/repositories/scan_repository_impl.dart';

class ScanProvider extends ChangeNotifier {
  ScanEntity? scan;
  Failure? failure;
  AnalyseEntity? analyseResult;
  RecommendationEntity? recommendationEntity;

  ScanProvider({
    this.scan,
    this.failure,
  });

  void eitherFailureOrScan() async {
    ScanRepositoryImpl repository = ScanRepositoryImpl(
      storageDataSource: ScanStorageDataSourceImpl(
        imagePicker: ImagePicker(),
      ),
      localDataSource: ScanLocalDataSourceImpl(
        sharedPreferences: await SharedPreferences.getInstance(),
      ),
      networkInfo: NetworkInfoImpl(
        DataConnectionChecker(),
      ),
      scanRemoteDataSource: ScanRemoteDataSource(),
    );

    final failureOrScan = await GetScanUseCase(scanRepository: repository).call(
        // scanParams: ScanParams(
        //   id: repository.storageDataSource.,
        //   image: scan!.image,
        // ),
        );

    failureOrScan.fold(
      (Failure newFailure) {
        scan = null;
        failure = newFailure;
        notifyListeners();
      },
      (ScanEntity newScan) {
        scan = newScan;
        failure = null;
        notifyListeners();
      },
    );
  }

  void eitherFailureOrAnalyse(GetAnalyseUseCase getAnalyseUseCase) async {
    final failureOrScan = await getAnalyseUseCase.call(scan!);

    failureOrScan.fold(
      (Failure newFailure) {
        analyseResult = null;
        failure = newFailure;
        notifyListeners();
      },
      (AnalyseEntity newScan) {
        analyseResult = newScan;
        failure = null;
        notifyListeners();
      },
    );
  }

  void eitherFailureOrRecommendation(
      GetRecommendationUseCase getRecommendationUseCase) async {
    final failureOrScan = await getRecommendationUseCase.call(analyseResult!);

    failureOrScan.fold(
      (Failure newFailure) {
        analyseResult = null;
        failure = newFailure;
        notifyListeners();
      },
      (RecommendationEntity newScan) {
        recommendationEntity = newScan;
        failure = null;
        notifyListeners();
      },
    );
  }
}
