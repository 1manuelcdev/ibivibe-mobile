import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ibiapabaapp/app/router/transitions/fade_through_page.dart';
import 'package:ibiapabaapp/app/router/transitions/shared_axis_page.dart';
import 'package:ibiapabaapp/core/preferences/user_preferences_state_provider.dart';
import 'package:ibiapabaapp/core/session/app_session_notifier_provider.dart';
import 'package:ibiapabaapp/features/auth/presentation/providers/auth_state_provider.dart';
import 'package:ibiapabaapp/features/cities/presentation/screens/cities_overview_screen.dart';
import 'package:ibiapabaapp/features/cities/presentation/screens/city_detail_screen.dart';
import 'package:ibiapabaapp/features/businesses/presentation/screens/businesses_overview_screen.dart';
import 'package:ibiapabaapp/features/businesses/presentation/screens/business_detail_screen.dart';
import 'package:ibiapabaapp/features/events/presentation/screens/events_overview_screen.dart';
import 'package:ibiapabaapp/features/events/presentation/screens/event_detail_screen.dart';
import 'package:ibiapabaapp/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:ibiapabaapp/features/search/presentation/screens/expanded_search_screen.dart';
import 'package:ibiapabaapp/features/onboarding/presentation/screens/business_data_screen.dart';
import 'package:ibiapabaapp/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:ibiapabaapp/features/onboarding/presentation/screens/interests/profile_businesses_interests_screen.dart';
import 'package:ibiapabaapp/features/onboarding/presentation/screens/interests/profile_events_interests_screen.dart';
import 'package:ibiapabaapp/features/profiles/presentation/widgets/screens/settings_screen.dart';
import 'package:ibiapabaapp/features/profiles/presentation/widgets/screens/under_development_screen.dart';
import 'package:ibiapabaapp/features/webviews/presentation/screens/webview_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:ibiapabaapp/app/router/app_shell.dart';
import 'package:ibiapabaapp/features/home/presentation/screens/home_screen.dart';
import 'package:ibiapabaapp/features/search/presentation/screens/search_screen.dart';
import 'package:ibiapabaapp/features/auth/presentation/screens/register_screen.dart';
import 'package:ibiapabaapp/features/profiles/presentation/widgets/screens/profile_screen.dart';
import 'package:ibiapabaapp/features/welcome/welcome_screen.dart';

part 'app_router_provider.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  final notifier = _AuthNotifier(ref);

  final router = GoRouter(
    initialLocation: '/app/home',
    refreshListenable: notifier,
    redirect: (context, state) {
      final isAuthenticated = notifier.isAuthenticated;
      final needsOnboarding = notifier.needsOnboarding;
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
    routes: [
      // ─── Welcome & Onboarding ──────────────────────────────────────────────
      GoRoute(
        path: '/welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),

      // ─── Interests (Onboarding & reutilizável) ─────────────────────────────
      GoRoute(
        path: '/app/interests/businesses',
        pageBuilder: (context, state) => SharedAxisPage(
          key: state.pageKey,
          child: UserCompaniesInterestsScreen(),
          type: SharedAxisTransitionType.horizontal,
          duration: const Duration(milliseconds: 500),
        ),
      ),

      GoRoute(
        path: '/app/interests/events',
        pageBuilder: (context, state) => SharedAxisPage(
          key: state.pageKey,
          child: UserEventsInterestsScreen(),
          type: SharedAxisTransitionType.horizontal,
          duration: const Duration(milliseconds: 500),
        ),
      ),

      // ─── Business Data (Onboarding & reutilizável) ─────────────────────────────
      GoRoute(
        path: '/app/businesses/basic-data',
        builder: (context, state) => const BusinessDataScreen(),
      ),

      // ─── Authentication ────────────────────────────────────────────────────
      GoRoute(
        path: '/auth/register',
        builder: (context, state) => const RegisterScreen(),
      ),

      // ─── AppShell ──────────────────────────────────────────────────────────
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          // ─── Home ──────────────────────────────────────────────────────────
          GoRoute(
            path: '/app/home',
            pageBuilder: (context, state) =>
                FadeThroughPage(key: state.pageKey, child: const HomeScreen()),
          ),

          // ─── Home > Search ─────────────────────────────────────────────────
          GoRoute(
            path: '/app/search',
            pageBuilder: (context, state) => FadeThroughPage(
              key: state.pageKey,
              child: const SearchScreen(),
            ),
          ),

          // ─── Home > Search > ExpandedSearch ────────────────────────────────
          GoRoute(
            path: '/app/search/expanded',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const ExpandedSearchScreen(),
              transitionDuration: const Duration(milliseconds: 400),
              reverseTransitionDuration: const Duration(milliseconds: 300),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOut,
                        reverseCurve: Curves.easeIn,
                      ),
                      child: child,
                    );
                  },
            ),
          ),

          // ─── Home > Favorites ──────────────────────────────────────────────
          GoRoute(
            path: '/app/favorites',
            pageBuilder: (context, state) => FadeThroughPage(
              key: state.pageKey,
              child: const FavoritesScreen(),
            ),
          ),
          // ─── Home > Profile ────────────────────────────────────────────────
          GoRoute(
            path: '/app/profile',
            pageBuilder: (context, state) =>
                FadeThroughPage(key: state.pageKey, child: ProfileScreen()),
          ),

          // ─── Home > Profile > Settings ─────────────────────────────────────
          GoRoute(
            path: '/app/settings',
            pageBuilder: (context, state) =>
                FadeThroughPage(key: state.pageKey, child: SettingsScreen()),
          ),

          // ─── Home > Under Development ──────────────────────────────────────
          GoRoute(
            path: '/app/under-development-notice',
            pageBuilder: (context, state) {
              final args = state.extra as UnderDevelopmentArgs?;
              return FadeThroughPage(
                key: state.pageKey,
                child: UnderDevelopmentScreen(
                  featureName: args?.featureName,
                  featureDescription: args?.featureDescription,
                  featureIcon: args?.featureIcon,
                ),
              );
            },
          ),

          // ─── Cities ────────────────────────────────────────────────────────
          GoRoute(
            path: '/app/cities',
            pageBuilder: (context, state) => FadeThroughPage(
              key: state.pageKey,
              child: CitiesOverviewScreen(),
            ),
            routes: [
              GoRoute(
                path: ':id',
                pageBuilder: (context, state) => SharedAxisPage(
                  key: state.pageKey,
                  child: CityDetailScreen(
                    id: state.pathParameters['id'].toString(),
                  ),
                  type: SharedAxisTransitionType.scaled,
                  duration: const Duration(milliseconds: 500),
                ),
              ),
            ],
          ),

          // ─── Businesses ─────────────────────────────────────────────────────
          GoRoute(
            path: '/app/businesses',
            pageBuilder: (context, state) => FadeThroughPage(
              key: state.pageKey,
              child: BusinessesOverviewScreen(),
            ),
            routes: [
              GoRoute(
                path: ':id',
                pageBuilder: (context, state) => SharedAxisPage(
                  key: state.pageKey,
                  child: BusinessDetailScreen(
                    id: state.pathParameters['id'].toString(),
                  ),
                  type: SharedAxisTransitionType.scaled,
                  duration: const Duration(milliseconds: 500),
                ),
              ),
            ],
          ),

          // ─── Events ────────────────────────────────────────────────────────
          GoRoute(
            path: '/app/events',
            pageBuilder: (context, state) => FadeThroughPage(
              key: state.pageKey,
              child: EventsOverviewScreen(),
            ),
            routes: [
              GoRoute(
                path: ':id',
                pageBuilder: (context, state) => SharedAxisPage(
                  key: state.pageKey,
                  child: EventDetailScreen(
                    id: state.pathParameters['id'].toString(),
                  ),
                  type: SharedAxisTransitionType.scaled,
                  duration: const Duration(milliseconds: 500),
                ),
              ),
            ],
          ),

          // ─── WebView ──────────────────────────────────────────────────────
          GoRoute(
            path: '/app/webview',
            builder: (context, state) {
              final extra = state.extra;

              if (extra is! WebViewArgs) {
                return const Scaffold(
                  body: Center(child: Text('Invalid arguments')),
                );
              }

              return WebViewScreen(args: extra);
            },
          ),
        ],
      ),
    ],
  );
  ref.onDispose(notifier.dispose);

  return router;
}

class _AuthNotifier extends ChangeNotifier {
  _AuthNotifier(this._ref) {
    _subscription = _ref.listen(appSessionProvider, (previous, next) {
      if (previous?.account != next.account ||
          previous?.needsOnboarding != next.needsOnboarding) {
        notifyListeners();
      }
    });
  }

  final Ref _ref;
  late final ProviderSubscription _subscription;

  bool get isAuthenticated => _ref.read(isAuthenticatedProvider);
  bool get needsOnboarding =>
      _ref.read(userPreferencesStateProvider).needsOnboarding;

  @override
  void dispose() {
    _subscription.close();
    super.dispose();
  }
}
