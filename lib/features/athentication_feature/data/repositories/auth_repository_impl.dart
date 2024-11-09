import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:meditest/core/params/params.dart';
import 'package:meditest/features/athentication_feature/business/entities/user_entity.dart';
import 'package:meditest/features/athentication_feature/data/models/user_model.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../business/repositories/auth_repository.dart';
import '../datasources/user_local_data_source.dart';
import '../datasources/user_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserLocalDataSource UserlocalDataSource;
  final NetworkInfo networkInfo;
  final UserRemoteDataSource userRemoteDataSource;

  AuthRepositoryImpl({
    required this.UserlocalDataSource,
    required this.networkInfo,
    required this.userRemoteDataSource,
  });

  @override
  Future<Either<Failure, UserModel>> getRegister(
      UserEntity userRegister) async {
    if (await networkInfo.isConnected!) {
      try {
        UserModel register =
            await userRemoteDataSource.getRegister(userRegister: userRegister);
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
        return Right(register);

        // localDataSource.cacheScan(scanToCache: storageScan);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      }
    } else {
      return Left(CacheFailure(errorMessage: 'This is a cache exception'));
    }
  }

  @override
  Future<Either<Failure, AuthParam>> logout() async {
    if (await networkInfo.isConnected!) {
      try {
        AuthParam logoutParam = await userRemoteDataSource.logout();

        return Right(logoutParam);

        // localDataSource.cacheScan(scanToCache: storageScan);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      }
    } else {
      return Left(CacheFailure(errorMessage: 'This is a cache exception'));
    }
  }

  @override
  Future<Either<Failure, AuthParam>> getLogin(UserEntity userLogin) async {
    if (await networkInfo.isConnected!) {
      try {
        AuthParam loginParam =
            await userRemoteDataSource.getLogin(userLogin: userLogin);

        return Right(loginParam);

        // localDataSource.cacheScan(scanToCache: storageScan);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      }
    } else {
      return Left(CacheFailure(errorMessage: 'This is a cache exception'));
    }
  }
}
