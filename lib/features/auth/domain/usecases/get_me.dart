import 'package:dartz/dartz.dart';
import 'package:ibiapabaapp/core/errors/failures/failures.dart';
import 'package:ibiapabaapp/features/auth/domain/entities/user.dart';
import 'package:ibiapabaapp/features/auth/domain/repositories/auth_repository.dart';

class GetMe {
  final AuthRepository repository;

  GetMe(this.repository);

  Future<Either<Failure, User>> call() {
    return repository.getMe();
  }
}
