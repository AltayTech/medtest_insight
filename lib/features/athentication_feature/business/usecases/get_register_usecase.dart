import 'package:dartz/dartz.dart';
import 'package:meditest/features/athentication_feature/business/repositories/auth_repository.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/user_entity.dart';

class GetRegisterUseCase {
  final AuthRepository authRepository;

  GetRegisterUseCase({
    required this.authRepository,
  });

  Future<Either<Failure, UserEntity>> call(
      String email, String password) async {
    UserEntity userRegister =
        UserEntity(id: 0, email: email, password: password);

    return await authRepository.getRegister(userRegister);
  }
}
