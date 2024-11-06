import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/errors/exceptions.dart';
import '../models/scan_model.dart';

abstract class ScanLocalDataSource {
  Future<void> cacheScan({required ScanModel? scanToCache});

  Future<ScanModel> getLastScan();
}

const cachedScan = 'CACHED_SCAN';

class ScanLocalDataSourceImpl implements ScanLocalDataSource {
  final SharedPreferences sharedPreferences;

  ScanLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<ScanModel> getLastScan() {
    final jsonString = sharedPreferences.getString(cachedScan);

    if (jsonString != null) {
      return Future.value(ScanModel.fromJson(json: json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheScan({required ScanModel? scanToCache}) async {
    if (scanToCache != null) {
      sharedPreferences.setString(
        cachedScan,
        json.encode(
          scanToCache.toJson(),
        ),
      );
    } else {
      throw CacheException();
    }
  }
}
