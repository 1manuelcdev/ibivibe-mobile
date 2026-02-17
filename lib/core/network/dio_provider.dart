import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ibiapabaapp/core/logger/logger.dart';
import 'package:ibiapabaapp/core/network/dio_logger_interceptor.dart';
import 'package:ibiapabaapp/core/storage/token_storage_provider.dart';
import 'package:ibiapabaapp/features/auth/presentation/providers/auth_providers.dart';
import 'package:ibiapabaapp/features/auth/presentation/providers/session_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['API_BASE_URL']!,
      connectTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  dio.interceptors.add(DioLoggerInterceptor(logger));

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        try {
          if (options.path.contains('/auth/refresh')) {
            return handler.next(options);
          }

          final storage = ref.read(tokenStorageProvider);
          final token = await storage.getAccessToken();

          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
        } catch (e) {
          // Se o storage falhar por qualquer motivo, o app não crasha
          logger.e("Erro ao recuperar token no Interceptor: $e");
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        // Se o erro for 401 e NÃO for na rota de refresh
        if (e.response?.statusCode == 401 &&
            !e.requestOptions.path.contains('/auth/refresh')) {
          try {
            // Tenta o refresh (que agora retorna AuthResult com User)
            final refreshResult = await ref.read(refreshTokensProvider).call();

            return await refreshResult.fold(
              (failure) async {
                // Se o refresh falhar, limpa a sessão e deixa o GoRouter expulsar o user
                await ref.read(sessionProvider.notifier).logout();
                return handler.next(e);
              },
              (authResult) async {
                // Atualiza a sessão
                await ref
                    .read(sessionProvider.notifier)
                    .initSession(authResult);

                // Repete a chamada original com o novo token
                final opts = e.requestOptions;
                opts.headers['Authorization'] =
                    'Bearer ${authResult.accessToken}';

                // Clone limpo criado para evitar recursão de interceptores
                final cloneDio = Dio(BaseOptions(baseUrl: opts.baseUrl));
                final response = await cloneDio.fetch(opts);

                return handler.resolve(response);
              },
            );
          } catch (err) {
            return handler.next(e);
          }
        }
        return handler.next(e);
      },
    ),
  );

  return dio;
}
