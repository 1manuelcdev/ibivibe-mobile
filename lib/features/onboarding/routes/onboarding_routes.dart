import 'package:go_router/go_router.dart';
import 'package:ibivibe/app/router/transitions/fade_through_page.dart';
import 'package:ibivibe/features/accounts/screens/interests/account_businesses_interests_screen.dart';
import 'package:ibivibe/features/accounts/screens/interests/account_events_interests_screen.dart';
import 'package:ibivibe/features/onboarding/screens/business_data_screen.dart';
import 'package:ibivibe/features/onboarding/screens/onboarding_screen.dart';

final List<RouteBase> onboardingRoutes = [
  GoRoute(
    path: '/onboarding/profile-select',
    pageBuilder: (context, state) =>
        FadeThroughPage(child: const OnboardingScreen(), key: state.pageKey),
  ),
  GoRoute(
    path: '/onboarding/interests/businesses',
    pageBuilder: (context, state) => FadeThroughPage(
      child: const AccountBusinessesInterestsScreen(
        nextRoute: '/onboarding/interests/events',
      ),
      key: state.pageKey,
    ),
  ),
  GoRoute(
    path: '/onboarding/interests/events',
    pageBuilder: (context, state) => FadeThroughPage(
      child: const AccountEventsInterestsScreen(),
      key: state.pageKey,
    ),
  ),
  GoRoute(
    path: '/onboarding/business-data',
    pageBuilder: (context, state) => FadeThroughPage(
      child: const BusinessDataScreen(),
      key: state.pageKey,
    ),
  ),
];
