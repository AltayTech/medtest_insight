import 'package:dartz/dartz.dart';
import 'package:meditest/core/params/params.dart';
import 'package:meditest/features/athentication_feature/business/repositories/auth_repository.dart';

import '../../../../../core/errors/failure.dart';

class GetLogoutUseCase {
  final AuthRepository authRepository;

  GetLogoutUseCase({
    required this.authRepository,
  });

  Future<Either<Failure, AuthParam>> call() async {
    return await authRepository.logout();
  }
}
