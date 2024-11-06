import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/errors/exceptions.dart';
import '../models/user_model.dart';

abstract class UserLocalDataSource {
  Future<void> cacheScan({required UserModel? userToCache});

  Future<UserModel> getLastScan();
}

const cachedScan = 'CACHED_SCAN';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<UserModel> getLastScan() {
    final jsonString = sharedPreferences.getString(cachedScan);

    if (jsonString != null) {
      return Future.value(UserModel.fromJson(json: json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheScan({required UserModel? userToCache}) async {
    if (userToCache != null) {
      sharedPreferences.setString(
        cachedScan,
        json.encode(
          userToCache.toJson(),
        ),
      );
    } else {
      throw CacheException();
    }
  }
}
