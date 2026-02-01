import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibiapabaapp/app/router/app_shell.dart';

import 'package:ibiapabaapp/features/home/home_screen.dart';
import 'package:ibiapabaapp/features/auth/presentation/screens/login_screen.dart';
import 'package:ibiapabaapp/features/onboarding/company_onboarding_screen.dart';
import 'package:ibiapabaapp/features/onboarding/user_onboarding_screen.dart';
import 'package:ibiapabaapp/features/auth/presentation/screens/register_screen.dart';
import 'package:ibiapabaapp/features/welcome/welcome_screen.dart';

class AppRouter {
  final _router = GoRouter(
    routes: [
      // Welcome & Onboarding
      GoRoute(path: '/', redirect: (_, _) => '/welcome'),
      GoRoute(
        path: '/welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/onboarding/user',
        builder: (context, state) => const UserOnboardingScreen(),
      ),
      GoRoute(
        path: '/onboarding/company',
        builder: (context, state) => const CompanyOnboardingScreen(),
      ),

      // Authentication
      GoRoute(
        path: '/auth/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/auth/register',
        builder: (context, state) => const RegisterScreen(),
      ),

      // Application
      ShellRoute(
        builder: (context, state, child) {
          return AppShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/app/home',
            builder: (_, _) => const HomeScreen(),
            routes: [
              GoRoute(
                path: 'details',
                builder: (_, _) => const Placeholder(child: Text('Details')),
              ),
            ],
          ),
          GoRoute(
            path: '/app/search',
            builder: (_, _) => const Placeholder(child: Text("Search")),
          ),
          GoRoute(
            path: '/app/favorites',
            builder: (_, _) => const Placeholder(child: Text("Favorites")),
          ),
          GoRoute(
            path: '/app/profile',
            builder: (_, _) => const Placeholder(child: Text("Profile")),
          ),
        ],
      ),
    ],
  );

  GoRouter get getRouterInstance {
    return _router;
  }
}
