import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ibiapabaapp/app/router/app_routes.dart';
import 'package:ibiapabaapp/core/preferences/user_preferences_state_provider.dart';
import 'package:ibiapabaapp/features/auth/presentation/providers/auth_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router_provider.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  final notifier = ValueNotifier<Object?>(null);
  ref.listen(isAuthenticatedProvider, (_, _) => notifier.value = Object());
  ref.listen(
    userPreferencesStateProvider.select((p) => p.needsOnboarding),
    (_, _) => notifier.value = Object(),
  );

  final router = GoRouter(
    initialLocation: '/app/home',
    refreshListenable: notifier,
    redirect: (context, state) {
      final isAuthenticated = ref.read(isAuthenticatedProvider);
      final needsOnboarding = ref.read(
        userPreferencesStateProvider.select((p) => p.needsOnboarding),
      );

      final isLoggingIn =
          state.matchedLocation.startsWith('/welcome') ||
          state.matchedLocation.startsWith('/auth');

      if (!isAuthenticated) {
        return isLoggingIn ? null : '/welcome';
      }

      if (needsOnboarding &&
          !state.matchedLocation.startsWith('/onboarding') &&
          !state.matchedLocation.startsWith('/app/interests')) {
        return '/onboarding';
      }

      if (isLoggingIn) {
        return '/app/home';
      }

      return null;
    },
    routes: appRoutes,
  );
  ref.onDispose(notifier.dispose);

  return router;
}
