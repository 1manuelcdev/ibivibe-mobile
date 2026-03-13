import 'package:ibiapabaapp/core/cache/cache_database_service.dart';
import 'package:ibiapabaapp/core/logger/logger.dart' as log_prov;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast.dart';

part 'cache_database_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Database> cacheDatabase(Ref ref) async {
  final loggerInstance = ref.watch(log_prov.loggerProvider);
  final service = CacheDatabaseService(logger: loggerInstance);
  return await service.init();
}
