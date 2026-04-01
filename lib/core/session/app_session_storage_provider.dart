import 'package:flutter/material.dart';
import 'package:ibiapabaapp/core/cache/cache_database_provider.dart';
import 'package:ibiapabaapp/core/cache/cache_database_service.dart';
import 'package:ibiapabaapp/features/cities/data/datasource/cities_local_datasource.dart';
import 'package:ibiapabaapp/features/cities/domain/entities/city.dart';
import 'package:ibiapabaapp/features/cities/presentation/providers/cities_providers.dart';
import 'package:ibiapabaapp/features/interests/domain/entities/user_interests.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_session_storage_provider.g.dart';

class AppSessionStorage {
  final CacheDatabaseService cacheService;
  final CitiesLocalDatasource citiesDatasource;

  static const _storeName = 'app_session_store';
  static const _prefKey = 'user_preferences';

  AppSessionStorage({
    required this.cacheService,
    required this.citiesDatasource,
  });

  Future<Map<String, dynamic>> _getPrefs() async {
    final prefs = await cacheService.getObject(
      storeName: _storeName,
      key: _prefKey,
      fromJson: (json) => Map<String, dynamic>.from(json),
    );
    return prefs ?? {};
  }

  // ─── Theme Mode ────────────────────────────────────────────────────────────
  Future<void> saveFavoriteThemeMode(ThemeMode mode) async {
    final prefs = await _getPrefs();
    prefs['favorite_theme_mode'] = mode.name;
    await cacheService.saveObject(
      storeName: _storeName,
      key: _prefKey,
      item: prefs,
      toMap: (i) => i,
    );
  }

  Future<ThemeMode> getFavoriteThemeMode() async {
    final prefs = await _getPrefs();
    final value = prefs['favorite_theme_mode'] as String?;
    return ThemeMode.values.byName(value ?? 'system');
  }

  // ─── Onboarding ────────────────────────────────────────────────────────────
  Future<void> saveNeedsOnboarding(bool value) async {
    final prefs = await _getPrefs();
    prefs['needs_onboarding'] = value;
    await cacheService.saveObject(
      storeName: _storeName,
      key: _prefKey,
      item: prefs,
      toMap: (i) => i,
    );
  }

  Future<bool> getNeedsOnboarding() async {
    final prefs = await _getPrefs();
    return prefs['needs_onboarding'] as bool? ?? true;
  }

  // ─── Current City ──────────────────────────────────────────────────────────
  Future<void> saveCurrentCityId(String cityId) async {
    final prefs = await _getPrefs();
    prefs['current_city_id'] = cityId;
    await cacheService.saveObject(
      storeName: _storeName,
      key: _prefKey,
      item: prefs,
      toMap: (i) => i,
    );
  }

  Future<void> clearCurrentCity() async {
    final prefs = await _getPrefs();
    prefs.remove('current_city_id');
    await cacheService.saveObject(
      storeName: _storeName,
      key: _prefKey,
      item: prefs,
      toMap: (i) => i,
    );
  }

  Future<City?> loadCurrentCity() async {
    final prefs = await _getPrefs();
    final cityId = prefs['current_city_id'] as String?;
    if (cityId == null) return null;
    return citiesDatasource.getCityById(cityId);
  }

  // ─── User Interests ────────────────────────────────────────────────────────
  Future<void> updateUserInterestsIds(UserInterests interests) async {
    final prefs = await _getPrefs();
    prefs['user_company_interests_ids'] = interests.companyIds;
    prefs['user_event_interests_ids'] = interests.eventIds;

    await cacheService.saveObject(
      storeName: _storeName,
      key: _prefKey,
      item: prefs,
      toMap: (i) => i,
    );
  }

  Future<UserInterests> getUserInterestsIds() async {
    final prefs = await _getPrefs();

    final companyResult = prefs['user_company_interests_ids'];
    final eventResult = prefs['user_event_interests_ids'];

    if (companyResult is List<dynamic> || eventResult is List<dynamic>) {
      return UserInterests(
        companyIds:
            (companyResult as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
        eventIds:
            (eventResult as List<dynamic>?)?.map((e) => e as String).toList() ??
            [],
      );
    }

    return const UserInterests();
  }
}

@riverpod
AppSessionStorage appSessionStorage(Ref ref) {
  final cacheService = ref.watch(cacheDatabaseServiceProvider);
  final cities = ref.watch(citiesLocalDatasourceProvider);

  return AppSessionStorage(
    cacheService: cacheService,
    citiesDatasource: cities,
  );
}
