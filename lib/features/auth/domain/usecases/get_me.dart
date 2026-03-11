import 'package:dartz/dartz.dart';
import 'package:ibiapabaapp/core/errors/failures/failures.dart';
import 'package:ibiapabaapp/core/usecases/usecase.dart';
import 'package:ibiapabaapp/features/auth/domain/entities/user.dart';
import 'package:ibiapabaapp/features/auth/domain/repositories/auth_repository.dart';

class GetMe implements Usecase<User, NoParams> {
  final AuthRepository repository;

  GetMe(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams _) {
    return repository.getMe();
  }
}
