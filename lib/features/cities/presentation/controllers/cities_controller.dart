import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ibiapabaapp/core/logger/handlers/controller_log_handler.dart';
import 'package:ibiapabaapp/core/logger/log_tags.dart';
import 'package:ibiapabaapp/core/logger/logger.dart';
import 'package:ibiapabaapp/core/session/app_session_notifier_provider.dart';
import 'package:ibiapabaapp/features/cities/domain/entities/city.dart';
import 'package:ibiapabaapp/features/cities/domain/usecases/get_all_cities.dart';
import 'package:ibiapabaapp/features/cities/presentation/providers/cities_providers.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cities_controller.g.dart';

@riverpod
class Cities extends _$Cities with ControllerLogHandler {
  @override
  Logger get logger => ref.read(loggerProvider);

  @override
  LogFeature get feature => LogFeature.cities;

  static const _cacheThreshold = Duration(hours: 1);

  @override
  Future<List<City>> build() async {
    final user = ref.watch(appSessionProvider.select((s) => s.user));
    if (user == null) return [];

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

    final result = await getAllCitiesUsecase(GetAllCitiesParams());

    return result.fold(
      (failure) {
        logControllerError(action: CityAction.getAllCities, failure: failure);
        throw Exception(failure.message);
      },
      (cities) async {
        logControllerSuccess(action: CityAction.getAllCities);
        await localCache.cacheCities(cities);
        return cities;
      },
    );
  }

  Future<void> _updateFromRemote() async {
    try {
      final getAllCitiesUsecase = ref.read(getAllCitiesProvider);
      final localCache = ref.read(citiesLocalDatasourceProvider);
      final result = await getAllCitiesUsecase(GetAllCitiesParams());

      result.fold(
        (failure) {
          logControllerError(action: CityAction.getAllCities, failure: failure);
          logger.e;
        },
        (cities) async {
          logControllerSuccess(action: CityAction.getAllCities);
          await localCache.cacheCities(cities);
          state = AsyncData(cities);
        },
      );
    } catch (e) {
      logger.e;
    }
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(() async {
      final getAllCitiesUsecase = ref.read(getAllCitiesProvider);
      final localCache = ref.read(citiesLocalDatasourceProvider);
      final result = await getAllCitiesUsecase(
        GetAllCitiesParams(forceRefresh: true),
      );

      return result.fold(
        (failure) {
          logControllerError(action: CityAction.getAllCities, failure: failure);
          throw Exception(failure.message);
        },
        (cities) async {
          logControllerSuccess(action: CityAction.getAllCities);
          await localCache.cacheCities(cities);
          return cities;
        },
      );
    });
  }
}
