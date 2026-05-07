import 'package:dartz/dartz.dart';
import 'package:ibiapabaapp/core/errors/failures/failures.dart';
import 'package:ibiapabaapp/features/accounts/domain/entities/account_interests.dart';
import 'package:ibiapabaapp/features/accounts/domain/entities/account_interests_response.dart';
import 'package:ibiapabaapp/features/accounts/domain/repositories/accounts_repository.dart';

class UpdateAccountInterestsParams {
  final String accountId;
  final AccountInterests interests;

  UpdateAccountInterestsParams({
    required this.accountId,
    required this.interests,
  });
}

class UpdateAccountInterests {
  final AccountsRepository _repository;

  UpdateAccountInterests(this._repository);

  Future<Either<AppFailure, AccountInterestsResponse>> call(
    UpdateAccountInterestsParams params,
  ) async {
    return await _repository.updateAccountInterests(
      accountId: params.accountId,
      interests: params.interests,
    );
  }
}
