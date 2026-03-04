import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  int _locationToIndex(String location) {
    if (location.startsWith('/app/search')) return 1;
    if (location.startsWith('/app/favorites')) return 2;
    if (location.startsWith('/app/profile')) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final index = _locationToIndex(location);
    final theme = context.theme;

    return NavigationBarTheme(
      data: NavigationBarThemeData(
        backgroundColor: theme.colors.background,
        indicatorColor: theme.colors.primary.withAlpha(28),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: theme.colors.primary, size: 24);
          }
          return IconThemeData(color: theme.colors.mutedForeground, size: 24);
        }),
        labelPadding: EdgeInsets.fromLTRB(0, 6, 0, 0),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final style = TextStyle(
            fontSize: 14,
            fontWeight: states.contains(WidgetState.selected)
                ? FontWeight.w600
                : FontWeight.w400,
            color: states.contains(WidgetState.selected)
                ? theme.colors.primary
                : theme.colors.mutedForeground,
          );
          return style;
        }),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: theme.colors.border, width: 0.5),
          ),
        ),
        child: NavigationBar(
          selectedIndex: index,
          elevation: 0,
          height: 72,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          onDestinationSelected: (i) {
            if (i == index) return;

            final routes = [
              '/app/home',
              '/app/search',
              '/app/favorites',
              '/app/profile',
            ];

            i == 0 ? context.go(routes[i]) : context.push(routes[i]);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined, size: 24),
              selectedIcon: Icon(Icons.home_rounded, size: 24),
              label: 'Início',
            ),
            NavigationDestination(
              icon: Icon(Icons.search_rounded, size: 24),
              selectedIcon: Icon(Icons.search_rounded, size: 24),
              label: 'Buscar',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_outline_rounded, size: 24),
              selectedIcon: Icon(Icons.favorite_rounded, size: 24),
              label: 'Favoritos',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline_rounded, size: 24),
              selectedIcon: Icon(Icons.person_rounded, size: 24),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}
