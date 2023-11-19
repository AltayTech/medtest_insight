import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:medtest_insight/features/athentication_feature/business/entities/user_entity.dart';
import 'package:medtest_insight/features/scan/business/entities/recommendation_entity.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../business/repositories/auth_repository.dart';
import '../datasources/user_remote_data_source.dart';
import '../datasources/user_local_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  final UserRemoteDataSource userRemoteDataSource;

  AuthRepositoryImpl({
    required this.localDataSource,
    required this.networkInfo,
    required this.userRemoteDataSource,
  });

  @override
  Future<Either<Failure, UserEntity>> getRegister() async {
    if (await networkInfo.isConnected!) {
      try {
        final recommendationResult =
            await userRemoteDataSource.getRecommendation(analyseResult: 'text');
        // storageScan.fold(
        //       (Failure newFailure) {
        //         return Left(ServerFailure(errorMessage: 'This is a server exception'));
        //
        //       },
        //       (ScanEntity newScan) {
        //         return Right(newScan);
        //   },
        //
        // );
        return Right(recommendationResult);

        // localDataSource.cacheScan(scanToCache: storageScan);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      }
    } else {
      return Left(CacheFailure(errorMessage: 'This is a cache exception'));
    }
  }
}
