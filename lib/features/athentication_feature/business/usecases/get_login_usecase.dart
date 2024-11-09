import 'package:dartz/dartz.dart';
import 'package:meditest/features/athentication_feature/business/repositories/auth_repository.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../entities/user_entity.dart';

class GetLoginUseCase {
  final AuthRepository authRepository;

  GetLoginUseCase({
    required this.authRepository,
  });

  Future<Either<Failure, AuthParam>> call(String email, String password) async {
    UserEntity userLogin = UserEntity(id: 0, email: email, password: password);

    return await authRepository.getLogin(userLogin);
  }
}
