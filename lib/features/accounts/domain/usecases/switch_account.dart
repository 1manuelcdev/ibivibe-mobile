import 'package:dartz/dartz.dart';
import 'package:ibiapabaapp/core/errors/failures/failures.dart';
import 'package:ibiapabaapp/core/usecases/usecase.dart';
import 'package:ibiapabaapp/features/accounts/domain/repositories/accounts_repository.dart';

class SwitchAccount implements Usecase<void, SwitchAccountParams> {
  final AccountsRepository repository;

  SwitchAccount(this.repository);

  @override
  Future<Either<AppFailure, void>> call(SwitchAccountParams params) {
    return repository.saveActiveAccountId(params.accountId);
  }
}

class SwitchAccountParams {
  final String accountId;

  SwitchAccountParams({required this.accountId});
}
