import 'package:flutter/material.dart';
import 'package:ibiapabaapp/core/location/get_nearest_city.dart';
import 'package:ibiapabaapp/core/location/location_provider.dart';
import 'package:ibiapabaapp/core/errors/failures/failures.dart';
import 'package:ibiapabaapp/core/logger/handlers/controller_log_handler.dart';
import 'package:ibiapabaapp/core/logger/log_tags.dart';
import 'package:ibiapabaapp/core/logger/logger.dart';
import 'package:ibiapabaapp/core/session/app_session.dart';
import 'package:ibiapabaapp/core/session/app_session_storage_provider.dart';
import 'package:ibiapabaapp/core/storage/token_storage_provider.dart';
import 'package:ibiapabaapp/features/auth/domain/entities/auth_result.dart';
import 'package:ibiapabaapp/features/auth/presentation/providers/auth_providers.dart';
import 'package:ibiapabaapp/features/cities/domain/entities/city.dart';
import 'package:ibiapabaapp/features/cities/domain/usecases/get_all_cities.dart';
import 'package:ibiapabaapp/features/cities/presentation/providers/cities_providers.dart';
import 'package:ibiapabaapp/features/interests/domain/entities/user_interests.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_session_notifier_provider.g.dart';

// ─── Notifier ────────────────────────────────────────────────────────────────
@Riverpod(keepAlive: true)
class AppSessionNotifier extends _$AppSessionNotifier
    with ControllerLogHandler {
  @override
  late final Logger logger;

  @override
  LogFeature get feature => LogFeature.session;

  @override
  AppSession build() {
    logger = ref.read(loggerProvider);
    return const AppSession();
  }

  AppSessionStorage get _storage => ref.read(appSessionStorageProvider);

  // ─── Initialization ────────────────────────────────────────────────────────
  Future<void> restore() async {
    final currentCity = await _storage.loadCurrentCity();
    final favoriteThemeMode = await _storage.getFavoriteThemeMode();
    final needsOnboarding = await _storage.getNeedsOnboarding();
    final userInterests = await _storage.getUserInterestsIds();

    if (!ref.mounted) return;

    state = state.copyWith(
      currentCity: currentCity,
      themeMode: favoriteThemeMode,
      needsOnboarding: needsOnboarding,
      userInterests: userInterests,
    );

    await _restoreUser();
  }

  Future<void> _restoreUser() async {
    final storage = ref.read(tokenStorageProvider);
    final accessToken = await storage.getAccessToken();
    final refreshToken = await storage.getRefreshToken();

    if (accessToken == null && refreshToken == null) return;
 
    final getMeResult = await ref.read(getMeProvider).call();
 
    if (!ref.mounted) return;

    await getMeResult.fold(
      (failure) async {
        logControllerError(action: AppSessionAction.restore, failure: failure);
        if (refreshToken != null) {
          final refreshResult = await ref.read(refreshTokensProvider).call();
          await refreshResult.fold(
            (_) async => logout(),
            (authResult) async => initSession(authResult),
          );
        } else {
          await logout();
        }
      },
      (user) async {
        logControllerSuccess(action: AppSessionAction.restore);
        state = state.copyWith(user: user);
      },
    );
  }

  // ─── Auth ──────────────────────────────────────────────────────────────────
  Future<void> initSession(AuthResult result) async {
    final storage = ref.read(tokenStorageProvider);
    await storage.saveTokens(result);
 
    if (!ref.mounted) return;

    state = state.copyWith(user: result.user);
    logControllerSuccess(action: AppSessionAction.initSession);
  }

  Future<void> setNeedsOnboarding(bool value) async {
    await _storage.saveNeedsOnboarding(value);
    state = state.copyWith(needsOnboarding: value);
  }

  Future<void> logout() async {
    final storage = ref.read(tokenStorageProvider);
    await storage.clearTokens();
    state = state.copyWith(clearUser: true, needsOnboarding: false);
    logControllerSuccess(action: AppSessionAction.logout);
  }

  // ─── City ──────────────────────────────────────────────────────────────────
  Future<void> setCurrentCity(City city) async {
    await _storage.saveCurrentCityId(city.id);
    state = state.copyWith(currentCity: city);
    logControllerSuccess(action: AppSessionAction.setCurrentCity);
  }

  Future<void> clearCurrentCity() async {
    await _storage.clearCurrentCity();
    state = state.copyWith(clearCity: true);
    logControllerSuccess(action: AppSessionAction.clearCurrentCity);
  }

  Future<AppFailure?> detectAndSetNearestCity() async {
    final citiesResult = await ref
        .read(getAllCitiesProvider)
        .call(const GetAllCitiesParams());
 
    if (!ref.mounted) return null;

    return citiesResult.fold(
      (failure) {
        logControllerError(
          action: AppSessionAction.detectNearestCity,
          failure: failure,
        );
        return failure;
      },
      (cities) async {
        final useCase = ref.read(getNearestCityProvider);
        final result = await useCase(cities);
 
        if (!ref.mounted) return null;

        return result.fold(
          (failure) {
            logControllerError(
              action: AppSessionAction.detectNearestCity,
              failure: failure,
            );
            if (failure is LocationPermissionPermanentlyDeniedFailure) {
              ref.read(locationServiceProvider).openAppSettings();
            }
            return failure;
          },
          (nearestCity) async {
            await setCurrentCity(nearestCity);
            logControllerSuccess(action: AppSessionAction.detectNearestCity);
            return null;
          },
        );
      },
    );
  }

  // ─── ThemeMode ─────────────────────────────────────────────────────────────
  Future<void> setFavoriteThemeMode(ThemeMode mode) async {
    await _storage.saveFavoriteThemeMode(mode);
    state = state.copyWith(themeMode: mode);
    logControllerSuccess(action: AppSessionAction.setFavoriteThemeMode);
  }

  Future<ThemeMode> getFavoriteThemeMode() async {
    return await _storage.getFavoriteThemeMode();
  }
  // ─── Device Position ───────────────────────────────────────────────────────

  /// Obtém e armazena a posição do dispositivo na sessão.
  ///
  /// - Chamado automaticamente na primeira abertura do sheet de localização.
  /// - [force] == true ignora o cache e faz nova leitura (ex: após "Me localize").
  /// - Falhas são silenciosas — posição permanece null sem exibir erro.
  Future<void> resolveDevicePosition({bool force = false}) async {
    if (!force && state.devicePosition != null) return;

    try {
      final locationService = ref.read(locationServiceProvider);
      final pos = await locationService.getCurrentLocation();
      state = state.copyWith(devicePosition: pos);
      logControllerSuccess(action: AppSessionAction.resolveDevicePosition);
    } catch (failure) {
      logControllerError(
        action: AppSessionAction.resolveDevicePosition,
        failure: failure,
      );
    }
  }

  // ─── UserInterests ───────────────────────────────────────────────────────────
  Future<void> updateUserInterests({required UserInterests interests}) async {
    await _storage.updateUserInterestsIds(interests);
    state = state.copyWith(userInterests: interests);
    logControllerSuccess(action: AppSessionAction.setUserInterests);
  }

  Future<UserInterests> getUserInterests() async {
    return await _storage.getUserInterestsIds();
  }
}

// ─── Helpers ─────────────────────────────────────────────────────────────────
@riverpod
bool isAuthenticated(Ref ref) {
  return ref.watch(appSessionProvider).user != null;
}

@riverpod
City? currentCity(Ref ref) {
  return ref.watch(appSessionProvider).currentCity;
}
