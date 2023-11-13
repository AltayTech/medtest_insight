import 'package:get_it/get_it.dart';
import 'package:medtest_insight/features/scan/presentation/providers/scan_provider.dart';

GetIt locator = GetIt.instance;

setup() async {
  /// Providers
  locator.registerSingleton<ScanProvider>(ScanProvider());
  // locator.registerSingleton<ScanStorageDataSourceImpl>(ScanStorageDataSourceImpl(imagePicker: null));

  // locator.registerSingleton<ScanRepositoryImpl>(ScanRepositoryImpl(storageDataSource: ImageSource()));
  // locator.registerSingleton<ScanProvider>(ScanProvider());
  // locator.registerSingleton<ScanProvider>(ScanProvider());

  /// Repositories
  // locator.registerSingleton(ScanRepositoryImpl(storageDataSource: storageDataSource, localDataSource: localDataSource, networkInfo: networkInfo))
}
