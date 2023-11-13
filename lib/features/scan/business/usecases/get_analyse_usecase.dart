import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:medtest_insight/features/scan/business/entities/scan_entity.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/analyse_entity.dart';
import '../repositories/scan_repository.dart';

class GetAnalyseUseCase {
  final ScanRepository scanRepository;

  GetAnalyseUseCase({
    required this.scanRepository,
  });

  Future<Either<Failure, AnalyseEntity>> call(ScanEntity picture) async {
    debugPrint('Analyse');
    debugPrint(picture.image.toString());





    return await scanRepository.getAnalyse(picture.image.toString());
  }
}
