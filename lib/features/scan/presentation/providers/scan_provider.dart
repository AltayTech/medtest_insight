import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../business/entities/scan_entity.dart';
import '../../business/usecases/get_scan.dart';
import '../../data/datasources/scan_local_data_source.dart';
import '../../data/datasources/scan_remote_data_source.dart';
import '../../data/datasources/scan_storage_data_source.dart';
import '../../data/repositories/scan_repository_impl.dart';

class ScanProvider extends ChangeNotifier {
  ScanEntity? scan;
  Failure? failure;

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
    );

    final failureOrScan = await GetScan(scanRepository: repository).call(
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
}
