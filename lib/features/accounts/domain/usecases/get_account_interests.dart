import 'package:dartz/dartz.dart';
import 'package:ibiapabaapp/core/errors/failures/failures.dart';
import 'package:ibiapabaapp/features/accounts/domain/entities/account_interests.dart';
import 'package:ibiapabaapp/features/accounts/domain/repositories/accounts_repository.dart';

class GetAccountInterests {
  final AccountsRepository _repository;

  GetAccountInterests(this._repository);

  Future<Either<AppFailure, AccountInterests>> call(String accountId) async {
    return await _repository.getAccountInterests(accountId);
  }
}
