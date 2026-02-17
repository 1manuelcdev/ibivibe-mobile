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

    return FBottomNavigationBar(
      style: (style) => style.copyWith(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        decoration: style.decoration.copyWith(
          color: context.theme.colors.background,
          border: Border(
            top: BorderSide(color: context.theme.colors.border, width: 0.5),
          ),
          borderRadius: BorderRadius.zero,
        ),
      ),
      index: index,
      onChange: (i) {
        final routes = [
          '/app/home',
          '/app/search',
          '/app/favorites',
          '/app/profile',
        ];
        i == 0 ? context.go(routes[i]) : context.push(routes[i]);
      },
      children: [
        _buildItem(
          context,
          0,
          index,
          Icons.home_rounded,
          Icons.home_outlined,
          'Início',
        ),
        _buildItem(
          context,
          1,
          index,
          Icons.search_rounded,
          Icons.search_rounded,
          'Buscar',
        ),
        _buildItem(
          context,
          2,
          index,
          Icons.favorite_rounded,
          Icons.favorite_outline_rounded,
          'Favoritos',
        ),
        _buildItem(
          context,
          3,
          index,
          Icons.person_rounded,
          Icons.person_outline_rounded,
          'Perfil',
        ),
      ],
    );
  }

  FBottomNavigationBarItem _buildItem(
    BuildContext context,
    int targetIndex,
    int currentIndex,
    IconData activeIcon,
    IconData inactiveIcon,
    String label,
  ) {
    final bool isActive = currentIndex == targetIndex;

    return FBottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: isActive
              ? context.theme.colors.primary.withAlpha((255 / 12).toInt())
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(isActive ? activeIcon : inactiveIcon),
      ),
      label: Text(label, style: TextStyle(fontSize: 12)),
    );
  }
}
