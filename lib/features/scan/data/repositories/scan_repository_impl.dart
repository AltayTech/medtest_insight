import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meditest/features/scan/business/entities/analyse_entity.dart';
import 'package:meditest/features/scan/business/entities/recommendation_entity.dart';
import 'package:meditest/features/scan/data/datasources/scan_storage_data_source.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../business/entities/scan_entity.dart';
import '../../business/repositories/scan_repository.dart';
import '../datasources/scan_local_data_source.dart';
import '../datasources/scan_remote_data_source.dart';
import '../models/scan_model.dart';

class ScanRepositoryImpl implements ScanRepository {
  final ScanStorageDataSource storageDataSource;
  final ScanLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  final ScanRemoteDataSource scanRemoteDataSource;

  ScanRepositoryImpl({
    required this.storageDataSource,
    required this.localDataSource,
    required this.networkInfo,
    required this.scanRemoteDataSource,
  });

  @override
  Future<Either<Failure, ScanEntity>> getScan(
      // {required ScanParams scanParams}
      ) async {
    if (await networkInfo.isConnected!) {
      try {
        final storageScan =
            await storageDataSource.getScan(imageSource: ImageSource.gallery);
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
        return storageScan;

        // localDataSource.cacheScan(scanToCache: storageScan);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      }
    } else {
      try {
        ScanModel localScan = await localDataSource.getLastScan();
        return Right(localScan);
      } on CacheException {
        return Left(CacheFailure(errorMessage: 'This is a cache exception'));
      }
    }
  }

  @override
  Future<Either<Failure, AnalyseEntity>> getAnalyse(String text) async {
    final analyseResult = AnalyseEntity(id: 1, text: text);
    return Right(analyseResult);
  }

  @override
  Future<Either<Failure, RecommendationEntity>> getRecommendation(
      String text) async {
    if (await networkInfo.isConnected!) {
      try {
        final recommendationResult =
            await scanRemoteDataSource.getRecommendation(analyseResult: text);
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
