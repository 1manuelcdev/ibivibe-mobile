import 'package:go_router/go_router.dart';
import 'package:ibiapabaapp/app/router/transitions/fade_through_page.dart';
import 'package:ibiapabaapp/features/favorites/presentation/screens/favorites_screen.dart';

List<RouteBase> favoritesRoutes = [
  // ─── Home > Favorites ──────────────────────────────────────────────
  GoRoute(
    path: '/app/favorites',
    pageBuilder: (context, state) =>
        FadeThroughPage(key: state.pageKey, child: const FavoritesScreen()),
  ),
];
