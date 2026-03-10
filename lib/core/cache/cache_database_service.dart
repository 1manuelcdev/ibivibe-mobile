import 'package:ibiapabaapp/core/logger/logger.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

class CacheDatabaseService {
  static late Database db;

  static Future<void> init() async {
    final appDir = await getApplicationCacheDirectory();
    await appDir.create(recursive: true);
    final dbPath = join(appDir.path, 'ibiapabaapp_cache.db');
    db = await databaseFactoryIo.openDatabase(dbPath);
  }

  static Future<void> clearAllData() async {
    try {
      final stores = [
        intMapStoreFactory.store('cities_store'),
        stringMapStoreFactory.store('cities_metadata_store'),
      ];

      await db.transaction((txn) async {
        for (final store in stores) {
          await store.delete(txn);
        }
      });

      logger.i('🧹 [Sembast] Cache local aniquilado com sucesso.');
    } catch (e, stack) {
      logger.e('❌ [Sembast] Erro ao limpar cache: $e');
      logger.e(stack);

      rethrow;
    }
  }
}
