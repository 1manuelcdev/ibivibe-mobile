import 'package:dartz/dartz.dart';
import 'package:ibiapabaapp/core/errors/failures/failures.dart';
import 'package:ibiapabaapp/core/usecases/usecase.dart';
import 'package:ibiapabaapp/features/auth/domain/entities/auth_result.dart';
import 'package:ibiapabaapp/features/auth/domain/repositories/auth_repository.dart';

class RefreshTokens implements Usecase<AuthResult, NoParams> {
  final AuthRepository repository;

  RefreshTokens(this.repository);

  @override
  Future<Either<Failure, AuthResult>> call(NoParams _) {
    return repository.refreshTokens();
  }
}
