import 'package:dartz/dartz.dart';
import 'package:ibiapabaapp/core/errors/failures/failures.dart';
import 'package:ibiapabaapp/core/usecases/usecase.dart';
import 'package:ibiapabaapp/features/favorites/domain/entities/favorite.dart';
import 'package:ibiapabaapp/features/favorites/domain/repositories/favorites_repository.dart';

class GetAllFavoritesByAccount
    implements Usecase<List<Favorite>, GetAllFavoritesByAccountParams> {
  final FavoritesRepository repository;
  GetAllFavoritesByAccount(this.repository);

  @override
  Future<Either<AppFailure, List<Favorite>>> call(
    GetAllFavoritesByAccountParams params,
  ) {
    return repository.getAllFavoritesByAccount(accountId: params.accountId);
  }
}

class GetAllFavoritesByAccountParams {
  final String accountId;
  GetAllFavoritesByAccountParams({required this.accountId});
}
