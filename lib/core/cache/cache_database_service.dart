import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

class CacheDatabaseService {
  final Logger logger;

  CacheDatabaseService({required this.logger});

  Future<Database> init() async {
    final appDir = await getApplicationCacheDirectory();
    await appDir.create(recursive: true);
    final dbPath = join(appDir.path, 'ibiapabaapp_cache.db');

    final db = await databaseFactoryIo.openDatabase(dbPath);
    logger.i('📦 [Sembast] Banco de dados inicializado com sucesso.');
    return db;
  }

  static Future<void> clearStore(Database db, Logger logger) async {
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
      logger.i('🧹 [Sembast] Cache local limpo.');
    } catch (e) {
      logger.e('❌ [Sembast] Erro ao limpar cache: $e');
    }
  }
}
