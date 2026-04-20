import 'package:ibiapabaapp/core/logger/logger.dart';
import 'package:ibiapabaapp/core/network/dio_provider.dart';
import 'package:ibiapabaapp/core/storage/token_storage_provider.dart';
import 'package:ibiapabaapp/features/auth/domain/repositories/auth_repository.dart';
import 'package:ibiapabaapp/features/auth/domain/usecases/check_unique_availability.dart';
import 'package:ibiapabaapp/features/auth/domain/usecases/get_me.dart';
import 'package:ibiapabaapp/features/auth/domain/usecases/refresh_tokens.dart';
import 'package:ibiapabaapp/features/auth/domain/usecases/register_with_email.dart';
import 'package:ibiapabaapp/features/auth/presentation/controllers/login_controller.dart';
import 'package:ibiapabaapp/features/auth/presentation/providers/auth_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ibiapabaapp/features/auth/infra/auth_remote_datasource_impl.dart';
import 'package:ibiapabaapp/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ibiapabaapp/features/auth/domain/usecases/login_with_email.dart';

part 'auth_providers.g.dart';

// DATA
@riverpod
AuthRemoteDatasourceImpl authRemoteDatasource(Ref ref) {
  final dio = ref.watch(dioProvider);
  final tokenStorage = ref.watch(tokenStorageProvider);
  return AuthRemoteDatasourceImpl(dio, tokenStorage);
}

@riverpod
AuthRepository authRepository(Ref ref) {
  final logger = ref.watch(loggerProvider);
  final datasource = ref.watch(authRemoteDatasourceProvider);
  return AuthRepositoryImpl(datasource: datasource, logger: logger);
}

// USECASES
@riverpod
LoginWithEmail loginWithEmail(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginWithEmail(repository);
}

@riverpod
RegisterWithEmail registerWithEmail(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return RegisterWithEmail(repository);
}

@riverpod
GetMe getMe(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return GetMe(repository);
}

@riverpod
RefreshTokens refreshTokens(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return RefreshTokens(repository);
}

@riverpod
CheckUniqueAvailability checkUniqueAvailability(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return CheckUniqueAvailability(repository);
}

// CONTROLLERS
@riverpod
LoginController loginController(Ref ref) {
  final logger = ref.watch(loggerProvider);
  final usecase = ref.watch(loginWithEmailProvider);
  final authState = ref.watch(authStateProvider.notifier);

  return LoginController(
    loginWithEmail: usecase,
    authState: authState,
    logger: logger,
  );
}

// TODO: aprofundar e falar sobre Metaprogramação (code generation no TCC)
