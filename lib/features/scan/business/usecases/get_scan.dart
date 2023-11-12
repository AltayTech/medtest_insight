import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/scan_entity.dart';
import '../repositories/scan_repository.dart';

class GetScan {
  final ScanRepository scanRepository;

  GetScan({required this.scanRepository});

  Future<Either<Failure, ScanEntity>> call(//     {
      //   required ScanParams scanParams,
      // }
      ) async {
    return await scanRepository.getScan(
        // scanParams: scanParams
        );
  }
}
