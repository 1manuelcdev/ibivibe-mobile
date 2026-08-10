import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ibivibe/app/app.dart';
import 'package:ibivibe/core/cache/cache_database_provider.dart';
import 'package:ibivibe/core/logger/logger.dart';
import 'package:ibivibe/core/session/app_session_notifier_provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final container = ProviderContainer();

  // O logger e o Dio podem ser criados durante a montagem inicial do router.
  // O .env precisa estar disponível antes do runApp, mas isso não acessa
  // banco, rede ou localização.
  try {
    await dotenv.load(fileName: '.env', isOptional: true);
  } catch (_) {
    dotenv.loadFromString(isOptional: true);
  }

  runApp(UncontrolledProviderScope(container: container, child: const App()));
  FlutterNativeSplash.remove();

  // O app deve renderizar antes de qualquer acesso a banco, rede ou localização.
  unawaited(_restoreApp(container));
}

Future<void> _restoreApp(ProviderContainer container) async {
  try {
    await container.read(initializedCacheServiceProvider.future);
    await container.read(appSessionProvider.notifier).restore();
  } catch (e, stack) {
    container
        .read(loggerProvider)
        .e(
          'Erro ao restaurar sessão em segundo plano',
          error: e,
          stackTrace: stack,
        );
  }
}
