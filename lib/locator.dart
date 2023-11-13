import 'package:get_it/get_it.dart';
import 'package:medtest_insight/features/scan/presentation/providers/scan_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/scan/data/datasources/scan_local_data_source.dart';

GetIt locator = GetIt.instance;

setup() async {
  /// Providers
  locator.registerSingleton<ScanProvider>(ScanProvider());
  final sharedPreference = await SharedPreferences.getInstance();
  locator.registerSingleton<ScanLocalDataSourceImpl>(
      ScanLocalDataSourceImpl(sharedPreferences: sharedPreference));


  /// Repositories

}
