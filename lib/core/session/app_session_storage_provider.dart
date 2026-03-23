import 'package:flutter/material.dart';
import 'package:ibiapabaapp/core/cache/cache_database_provider.dart';
import 'package:ibiapabaapp/features/cities/data/datasource/cities_local_datasource.dart';
import 'package:ibiapabaapp/features/cities/domain/entities/city.dart';
import 'package:ibiapabaapp/features/cities/presentation/providers/cities_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast.dart';

part 'app_session_storage_provider.g.dart';

class AppSessionStorage {
  AppSessionStorage({required this.db, required this.citiesDatasource});

  final Database db;
  final CitiesLocalDatasource citiesDatasource;
  final _store = stringMapStoreFactory.store('app_session_store');

  // ─── Theme Mode ────────────────────────────────────────────────────────────
  Future<void> saveFavoriteThemeMode(ThemeMode mode) async {
    await _store.record('preferences').update(db, {
      'favorite_theme_mode': mode.name,
    });
  }

  Future<ThemeMode> getFavoriteThemeMode() async {
    final record = await _store.record('preferences').get(db);
    final value = record?['favorite_theme_mode'] as String?;
    return ThemeMode.values.byName(value ?? 'system');
  }

  // ─── Current City ──────────────────────────────────────────────────────────
  Future<void> saveCurrentCityId(String cityId) async {
    await _store.record('preferences').put(db, {'current_city_id': cityId});
  }

  Future<void> clearCurrentCity() async {
    final record = await _store.record('preferences').get(db);
    if (record == null) return;
    final updated = Map<String, Object?>.from(record)
      ..remove('current_city_id');
    await _store.record('preferences').put(db, updated);
  }

  /// Resolve o ID salvo para uma entidade [City] via cache local.
  Future<City?> loadCurrentCity() async {
    final record = await _store.record('preferences').get(db);
    final cityId = record?['current_city_id'] as String?;
    if (cityId == null) return null;
    return citiesDatasource.getCityById(cityId);
  }
}

// ─── Storage ─────────────────────────────────────────────────────────────────
@riverpod
AppSessionStorage appSessionStorage(Ref ref) {
  final db = ref.watch(cacheDatabaseProvider).requireValue;
  final cities = ref.watch(citiesLocalDatasourceProvider);
  return AppSessionStorage(db: db, citiesDatasource: cities);
}
