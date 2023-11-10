import 'package:dartz/dartz.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../business/repositories/scan_repository.dart';
import '../datasources/scan_local_data_source.dart';
import '../datasources/scan_remote_data_source.dart';
import '../models/scan_model.dart';

class ScanRepositoryImpl implements ScanRepository {
  final ScanRemoteDataSource remoteDataSource;
  final ScanLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ScanRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ScanModel>> getScan(
      {required ScanParams scanParams}) async {
    if (await networkInfo.isConnected!) {
      try {
        ScanModel remoteScan =
            await remoteDataSource.getScan(scanParams: scanParams);

        localDataSource.cacheScan(scanToCache: remoteScan);

        return Right(remoteScan);
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
}
