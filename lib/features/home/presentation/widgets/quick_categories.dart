import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:ibiapabaapp/shared/ui/fragments/carousel/horizontal_infinite_carousel.dart';

class QuickCategoriesList extends StatelessWidget {
  final List<String> _categories = [
    'Restaurantes',
    'Hotéis e Pousadas',
    'Postos de Gasolina',
    'Banhos',
    'Comércio',
    'Aventura',
  ];

  QuickCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalInfiniteCarousel(
      isLoading: false,
      items: _categories,
      listHeight: 40,
      separator: Container(width: 6),
      itemBuilder: (context, category) => FButton(
        onPress: () {
          showFToast(
            context: context,
            title: Text(
              'TODO: Redirecionar para categoria "$category"',
              style: context.theme.typography.sm,
            ),
          );
        },
        style: FButtonStyle.secondary(),
        child: Text(category, style: TextStyle(fontSize: 14)),
      ),
    );
  }
}
