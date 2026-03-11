import 'package:ibiapabaapp/core/storage/token_storage_provider.dart';
import 'package:ibiapabaapp/core/usecases/usecase.dart';
import 'package:ibiapabaapp/features/auth/presentation/providers/auth_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ibiapabaapp/features/auth/domain/entities/user.dart';
import 'package:ibiapabaapp/features/auth/domain/entities/auth_result.dart';

part 'session_provider.g.dart';

@Riverpod(keepAlive: true)
class Session extends _$Session {
  @override
  User? build() => null;

  Future<void> restoreSession() async {
    final storage = ref.read(tokenStorageProvider);
    final accessToken = await storage.getAccessToken();
    final refreshToken = await storage.getRefreshToken();

    if (accessToken == null && refreshToken == null) {
      state = null;
      return;
    }

    // Tenta getMe com o accessToken atual
    final getMeResult = await ref.read(getMeProvider).call(NoParams());

    await getMeResult.fold(
      (failure) async {
        // getMe falhou — tenta refresh manualmente (sem passar pelo interceptador)
        if (refreshToken != null) {
          final refreshResult = await ref
              .read(refreshTokensProvider)
              .call(NoParams());
          await refreshResult.fold(
            (_) async => logout(),
            (authResult) async => initSession(authResult),
          );
        } else {
          await logout();
        }
      },
      (user) async {
        state = user;
      },
    );
  }

  Future<void> initSession(AuthResult result) async {
    final storage = ref.read(tokenStorageProvider);
    await storage.saveTokens(result); // await garantido
    state = result.user;
  }

  Future<void> logout() async {
    final storage = ref.read(tokenStorageProvider);
    await storage.clearTokens();
    state = null;
  }
}

@riverpod
bool isAuthenticated(Ref ref) {
  return ref.watch(sessionProvider) != null;
}
