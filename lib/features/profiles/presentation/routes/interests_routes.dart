import 'package:animations/animations.dart';
import 'package:go_router/go_router.dart';
import 'package:ibiapabaapp/app/router/transitions/shared_axis_page.dart';
import 'package:ibiapabaapp/features/onboarding/presentation/screens/interests/profile_businesses_interests_screen.dart';
import 'package:ibiapabaapp/features/onboarding/presentation/screens/interests/profile_events_interests_screen.dart';

final List<RouteBase> interestsRoutes = [
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
];
