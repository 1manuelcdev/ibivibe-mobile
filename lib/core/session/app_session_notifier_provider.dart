import 'package:ibiapabaapp/core/location/presentation/providers/location_state_provider.dart';
import 'package:ibiapabaapp/core/preferences/user_preferences_state_provider.dart';
import 'package:ibiapabaapp/features/auth/presentation/providers/auth_state_provider.dart';
import 'package:ibiapabaapp/core/logger/handlers/controller_log_handler.dart';
import 'package:ibiapabaapp/core/logger/log_tags.dart';
import 'package:ibiapabaapp/core/logger/logger.dart';
import 'package:ibiapabaapp/core/session/app_session.dart';
import 'package:ibiapabaapp/features/profiles/presentation/providers/profile_state_provider.dart';
import 'package:ibiapabaapp/features/search/presentation/providers/search_state_provider.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_session_notifier_provider.g.dart';

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

    final authData = ref.watch(authStateProvider);
    final profileData = ref.watch(profileStateProvider);
    final preferences = ref.watch(userPreferencesStateProvider);
    final searches = ref.watch(searchStateProvider);
    final location = ref.watch(locationStateProvider);

    return AppSession(
      account: authData.account,
      activeProfile: profileData.activeProfile,
      accountProfiles: profileData.profiles,
      themeMode: preferences.themeMode,
      needsOnboarding: preferences.needsOnboarding,
      recentSearches: searches.recentSearches,
      currentCity: location.currentCity,
    );
  }

  Future<void> restore() async {
    try {
      await ref.read(authStateProvider.notifier).restore();
      await ref.read(userPreferencesStateProvider.notifier).restore();
      await ref.read(locationStateProvider.notifier).restore();
      await ref.read(searchStateProvider.notifier).restore();

      logControllerSuccess(action: AppSessionAction.restore);
    } catch (e) {
      logControllerError(action: AppSessionAction.restore, failure: e);
    }
  }
}
