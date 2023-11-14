import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medtest_insight/core/connection/network_info.dart';
import 'package:medtest_insight/features/scan/business/usecases/get_analyse_usecase.dart';
import 'package:medtest_insight/features/scan/business/usecases/get_recommendation_usecase.dart';
import 'package:medtest_insight/features/scan/data/datasources/scan_remote_data_source.dart';
import 'package:medtest_insight/features/scan/presentation/providers/scan_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/scan/business/repositories/scan_repository.dart';
import 'features/scan/business/usecases/get_scan_usecase.dart';
import 'features/scan/data/datasources/scan_local_data_source.dart';
import 'features/scan/data/datasources/scan_storage_data_source.dart';
import 'features/scan/data/repositories/scan_repository_impl.dart';

GetIt locator = GetIt.instance;

setup() async {
  final sharedPreference = await SharedPreferences.getInstance();
  locator.registerSingleton<ScanLocalDataSource>(
      ScanLocalDataSourceImpl(sharedPreferences: sharedPreference));

  final imagePicker = ImagePicker();
  locator.registerSingleton<ScanStorageDataSource>(
      ScanStorageDataSourceImpl(imagePicker: imagePicker));
  locator.registerSingleton<ScanRemoteDataSource>(ScanRemoteDataSource());

  /// Repositories
  final networkInfo = NetworkInfoImpl(DataConnectionChecker());
  locator.registerSingleton<ScanRepository>(ScanRepositoryImpl(
    storageDataSource: locator(),
    localDataSource: locator(),
    networkInfo: networkInfo,
    scanRemoteDataSource: locator(),
  ));

  /// use case
  locator.registerSingleton<GetScanUseCase>(
      GetScanUseCase(scanRepository: locator()));
  locator.registerSingleton<GetAnalyseUseCase>(
      GetAnalyseUseCase(scanRepository: locator()));
  locator.registerSingleton<GetRecommendationUseCase>(
      GetRecommendationUseCase(scanRepository: locator()));

  /// statemanagement
  locator.registerSingleton<ScanProvider>(ScanProvider());
}
