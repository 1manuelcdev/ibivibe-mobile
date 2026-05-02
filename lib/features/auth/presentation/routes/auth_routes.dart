import 'package:go_router/go_router.dart';
import 'package:ibiapabaapp/features/auth/presentation/screens/register_screen.dart';

final List<RouteBase> authRoutes = [
  GoRoute(
    path: '/auth/register',
    builder: (context, state) => const RegisterScreen(),
  ),
];
