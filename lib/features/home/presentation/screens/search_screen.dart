import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:ibiapabaapp/core/network/dio_client.dart';
import 'package:ibiapabaapp/features/home/presentation/widgets/explore_cities_section.dart';
import 'package:ibiapabaapp/shared/ui/items_grid.dart';
import 'package:ibiapabaapp/shared/ui/main_wrapper.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> companiesCategories = [
      "Restaurantes",
      "Hotéis e pousadas",
      "Postos de gasolina",
      "Banhos",
      "Comércio",
      "Aventura",
      "Temáticos",
      "Ver mais",
    ];
    const List<String> eventsCategories = [
      "Religiosos",
      "Shows",
      "Esportivos",
      "Cultura e arte",
      "Palestras",
      "Ver mais",
    ];

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
                onTap: (category) {
                  DioClient().getInstance.get('/users');
                },
              ),
              ItemsGrid(title: "Eventos", items: eventsCategories),
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
