import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logger.g.dart';

@Riverpod(keepAlive: true)
Logger logger(Ref ref) {
  final configuredLevel = dotenv.isInitialized
      ? dotenv.env['LOGGER_LEVEL']
      : null;

  return Logger(
    level: Level.values.firstWhere(
      (level) => level.name == configuredLevel,
      orElse: () => Level.error,
    ),
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 80,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );
}
