import 'package:dartz/dartz.dart';
import 'package:medtest_insight/features/athentication_feature/business/entities/user_entity.dart';

import '../../../../../core/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> getRegister(UserEntity userRegister);

// Future<Either<Failure, AnalyseEntity>> getAnalyse(String text);
// Future<Either<Failure, RecommendationEntity>> getRecommendation(String text);
}
