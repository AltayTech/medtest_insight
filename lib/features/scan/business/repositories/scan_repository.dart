import 'package:dartz/dartz.dart';
import 'package:meditest/features/scan/business/entities/analyse_entity.dart';
import 'package:meditest/features/scan/business/entities/recommendation_entity.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/scan_entity.dart';

abstract class ScanRepository {
  Future<Either<Failure, ScanEntity>> getScan();

  Future<Either<Failure, AnalyseEntity>> getAnalyse(String text);

  Future<Either<Failure, RecommendationEntity>> getRecommendation(String text);
}
