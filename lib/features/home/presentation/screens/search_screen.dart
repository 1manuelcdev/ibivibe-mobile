import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:ibiapabaapp/core/network/dio_provider.dart';
import 'package:ibiapabaapp/features/home/presentation/widgets/explore_cities_section.dart';
import 'package:ibiapabaapp/shared/ui/items_grid.dart';
import 'package:ibiapabaapp/shared/ui/main_wrapper.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const List<String> companiesCategories = [
      "Restaurantes",
      "Hotéis e pousadas",
      "Postos de gasolina",
      "Banhos",
      "Comércio",
      "Aventura",
      "Temáticos",
    ];
    const List<String> eventsCategories = [
      "Religiosos",
      "Shows",
      "Esportivos",
      "Cultura e arte",
      "Palestras",
    ];

    final dioClient = ref.watch(dioProvider);

    return SingleChildScrollView(
      child: Column(
        spacing: 16,
        children: [
          _SearchHeader(),
          MainWrapper(
            children: [
              ItemsGrid(
                title: "Empresas",
                items: companiesCategories,
                onItemTap: (category) {
                  dioClient.get('/users');
                },
                onSeeAllTap: () {},
              ),
              ItemsGrid(
                title: "Eventos",
                items: eventsCategories,
                onSeeAllTap: () {},
              ),
              ExploreCitiesSection(),
            ],
          ),
        ],
      ),
    );
  }
}

class _SearchHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colors.muted.withAlpha(100),
      ),
      child: Padding(
        padding: const .fromLTRB(24, 32, 24, 24),
        child: FTextField(
          hint: 'O que vamos fazer hoje na Ibiapaba?',
          textAlign: .start,
        ),
      ),
    );
  }
}
