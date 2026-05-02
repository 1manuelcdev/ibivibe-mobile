import 'package:go_router/go_router.dart';
import 'package:ibiapabaapp/app/router/transitions/fade_through_page.dart';
import 'package:ibiapabaapp/features/profiles/presentation/widgets/screens/profile_screen.dart';
import 'package:ibiapabaapp/features/profiles/presentation/widgets/screens/settings_screen.dart';

final List<RouteBase> profilesRoutes = [
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
];
