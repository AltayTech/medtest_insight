import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../entities/scan_entity.dart';


abstract class ScanRepository {
  Future<Either<Failure, ScanEntity>> getScan(
  // {
    // required ScanParams scanParams,
  // }
  );
}
