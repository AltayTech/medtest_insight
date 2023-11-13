import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medtest_insight/features/scan/business/entities/analyse_entity.dart';
import 'package:medtest_insight/features/scan/data/datasources/scan_storage_data_source.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../business/entities/scan_entity.dart';
import '../../business/repositories/scan_repository.dart';
import '../../presentation/providers/scan_provider.dart';
import '../datasources/scan_local_data_source.dart';
import '../models/scan_model.dart';

class ScanRepositoryImpl implements ScanRepository {
  final ScanStorageDataSource storageDataSource;
  final ScanLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ScanRepositoryImpl({
    required this.storageDataSource,
    required this.localDataSource,
    required this.networkInfo,
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
  Future<Either<Failure, AnalyseEntity>> getAnalyse() {
    // TODO: implement getAnalyse
    throw UnimplementedError();
  }
}
