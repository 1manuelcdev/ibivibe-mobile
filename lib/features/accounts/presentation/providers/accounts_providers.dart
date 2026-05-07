import 'package:ibiapabaapp/core/cache/cache_database_provider.dart';
import 'package:ibiapabaapp/core/logger/logger.dart';
import 'package:ibiapabaapp/core/network/dio_provider.dart';
import 'package:ibiapabaapp/features/accounts/data/datasources/accounts_local_storage.dart';
import 'package:ibiapabaapp/features/accounts/data/datasources/accounts_remote_datasource.dart';
import 'package:ibiapabaapp/features/accounts/data/repositories/accounts_repository_impl.dart';
import 'package:ibiapabaapp/features/accounts/domain/repositories/accounts_repository.dart';
import 'package:ibiapabaapp/features/accounts/domain/usecases/get_account_interests.dart';
import 'package:ibiapabaapp/features/accounts/domain/usecases/get_cached_accounts.dart';
import 'package:ibiapabaapp/features/accounts/domain/usecases/switch_account.dart';
import 'package:ibiapabaapp/features/accounts/domain/usecases/update_account_interests.dart';
import 'package:ibiapabaapp/features/accounts/infra/accounts_local_storage_impl.dart';
import 'package:ibiapabaapp/features/accounts/infra/accounts_remote_datasource_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'accounts_providers.g.dart';

// ============ DATA ============
@riverpod
AccountsRemoteDatasource accountsRemoteDatasource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return AccountsRemoteDatasourceImpl(dio);
}

@riverpod
AccountsLocalStorage accountsLocalStorage(Ref ref) {
  final cacheService = ref.watch(cacheDatabaseServiceProvider);
  return AccountsLocalStorageImpl(cacheService);
}

@riverpod
AccountsRepository accountsRepository(Ref ref) {
  final logger = ref.watch(loggerProvider);
  final remote = ref.watch(accountsRemoteDatasourceProvider);
  final local = ref.watch(accountsLocalStorageProvider);
  return AccountsRepositoryImpl(
    remoteDatasource: remote,
    localStorage: local,
    logger: logger,
  );
}

// ============ USECASES ============
@riverpod
GetCachedAccounts getCachedAccounts(Ref ref) {
  final repository = ref.watch(accountsRepositoryProvider);
  return GetCachedAccounts(repository);
}

@riverpod
SwitchAccount switchAccount(Ref ref) {
  final repository = ref.watch(accountsRepositoryProvider);
  return SwitchAccount(repository);
}

@riverpod
GetAccountInterests getAccountInterests(Ref ref) {
  final repository = ref.watch(accountsRepositoryProvider);
  return GetAccountInterests(repository);
}

@riverpod
UpdateAccountInterests updateAccountInterests(Ref ref) {
  final repository = ref.watch(accountsRepositoryProvider);
  return UpdateAccountInterests(repository);
}
