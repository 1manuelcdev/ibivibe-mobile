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
      safeAreaBottom: true,
      index: index,
      onChange: (i) {
        switch (i) {
          case 0:
            context.go('/app/home');
            break;
          case 1:
            context.go('/app/search');
            break;
          case 2:
            context.go('/app/favorites');
            break;
          case 3:
            context.go('/app/profile');
            break;
        }
      },
      children: const [
        FBottomNavigationBarItem(
          icon: Icon(FIcons.house),
          label: Text('Início'),
        ),
        FBottomNavigationBarItem(
          icon: Icon(FIcons.search),
          label: Text('Buscar'),
        ),
        FBottomNavigationBarItem(
          icon: Icon(FIcons.heart),
          label: Text('Favoritos'),
        ),
        FBottomNavigationBarItem(
          icon: Icon(FIcons.user),
          label: Text('Perfil'),
        ),
      ],
    );
  }
}
