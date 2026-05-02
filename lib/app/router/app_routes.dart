import 'package:go_router/go_router.dart';
import 'package:ibiapabaapp/app/router/app_shell.dart';
import 'package:ibiapabaapp/features/auth/presentation/routes/auth_routes.dart';
import 'package:ibiapabaapp/features/businesses/presentation/routes/businesses_routes.dart';
import 'package:ibiapabaapp/features/cities/presentation/routes/cities_routes.dart';
import 'package:ibiapabaapp/features/events/presentation/routes/events_routes.dart';
import 'package:ibiapabaapp/features/favorites/presentation/routes/favorites_routes.dart';
import 'package:ibiapabaapp/features/home/presentation/routes/home_routes.dart';
import 'package:ibiapabaapp/features/profiles/presentation/routes/interests_routes.dart';
import 'package:ibiapabaapp/features/profiles/presentation/routes/profiles_routes.dart';
import 'package:ibiapabaapp/features/search/presentation/routes/search_routes.dart';
import 'package:ibiapabaapp/features/webviews/routes/webviews_routes.dart';
import 'package:ibiapabaapp/features/welcome/routes/welcome_routes.dart';

final List<RouteBase> appRoutes = [
  ...welcomeRoutes,
  ...interestsRoutes,
  ...authRoutes,
  ShellRoute(
    builder: (context, state, child) => AppShell(child: child),
    routes: [
      ...searchRoutes,
      ...favoritesRoutes,
      ...webviewsRoutes,
      ...profilesRoutes,
      ...homeRoutes,
      ...citiesRoutes,
      ...businessesRoutes,
      ...eventsRoutes,
    ],
  ),
];
