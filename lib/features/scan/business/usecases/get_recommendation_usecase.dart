import 'package:dartz/dartz.dart';
import 'package:meditest/features/scan/business/entities/recommendation_entity.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/analyse_entity.dart';
import '../repositories/scan_repository.dart';

class GetRecommendationUseCase {
  final ScanRepository scanRepository;

  GetRecommendationUseCase({
    required this.scanRepository,
  });

  Future<Either<Failure, RecommendationEntity>> call(
      AnalyseEntity analyse) async {
    return await scanRepository.getRecommendation(analyse.text);
  }
}
