import 'package:dartz/dartz.dart';
import 'package:medtest_insight/features/athentication_feature/business/repositories/auth_repository.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/user_entity.dart';

class GetRegisterUseCase {
  final AuthRepository authRepository;

  GetRegisterUseCase({
    required this.authRepository,
  });

  Future<Either<Failure, UserEntity>> call() async {
    return await authRepository.getRegister();
  }
}
