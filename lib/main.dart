import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ibiapabaapp/app/app.dart';
import 'package:ibiapabaapp/core/cache/cache_database_service.dart';
import 'package:ibiapabaapp/core/logger/logger.dart';
import 'package:ibiapabaapp/features/auth/presentation/providers/session_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    dotenv.load(fileName: ".env"),
    CacheDatabaseService.init(),
  ]);

  final container = ProviderContainer();

  try {
    await container.read(sessionProvider.notifier).restoreSession();
  } catch (e, stack) {
    logger.e(
      'Erro fatal ao restaurar sessão na main',
      error: e,
      stackTrace: stack,
    );
  }

  runApp(UncontrolledProviderScope(container: container, child: const App()));
}
