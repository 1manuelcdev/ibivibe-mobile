import 'dart:math' as logger;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ibiapabaapp/features/auth/presentation/providers/session_provider.dart';
import 'package:ibiapabaapp/features/cities/domain/entities/city.dart';
import 'package:ibiapabaapp/features/cities/presentation/providers/cities_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cities_controller.g.dart';

@riverpod
class Cities extends _$Cities {
  static const _cacheThreshold = Duration(hours: 1);

  @override
  Future<List<City>> build() async {
    // Aguarda a sessão estar pronta antes de qualquer requisição remota
    final session = ref.watch(sessionProvider.select((s) => s));

    // Se não está autenticado, não tenta buscar remotamente
    if (session == null) {
      return [];
    }

    final localCache = ref.read(citiesLocalDatasourceProvider);
    final cachedCities = await localCache.getCachedCities();
    final lastUpdate = await localCache.getLastCacheTime();

    if (cachedCities.isNotEmpty) {
      final now = DateTime.now();
      final isStale =
          lastUpdate == null || now.difference(lastUpdate) > _cacheThreshold;

      if (isStale) {
        Future.microtask(() => _updateFromRemote());
      }
      return cachedCities;
    }

    return _fetchRemote();
  }

  Future<List<City>> _fetchRemote() async {
    final getAllCitiesUsecase = ref.read(getAllCitiesProvider);
    final localCache = ref.read(citiesLocalDatasourceProvider);

    final result = await getAllCitiesUsecase();

    return result.fold((failure) => throw Exception(failure.message), (
      cities,
    ) async {
      await localCache.cacheCities(cities);
      return cities;
    });
  }

  Future<void> _updateFromRemote() async {
    try {
      final getAllCitiesUsecase = ref.read(getAllCitiesProvider);
      final localCache = ref.read(citiesLocalDatasourceProvider);

      final result = await getAllCitiesUsecase();

      result.fold((failure) => logger.e, (cities) async {
        await localCache.cacheCities(cities);
        state = AsyncData(cities);
      });
    } catch (e) {
      logger.e;
    }
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(() async {
      final getAllCitiesUsecase = ref.read(getAllCitiesProvider);
      final localCache = ref.read(citiesLocalDatasourceProvider);

      final result = await getAllCitiesUsecase(forceRefresh: true);

      return result.fold((failure) => throw Exception(failure.message), (
        cities,
      ) async {
        await localCache.cacheCities(cities);
        return cities;
      });
    });
  }
}
