import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class SheetDragIndicator extends StatelessWidget {
  const SheetDragIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.colors;

    return Center(
      child: Container(
        width: 64,
        height: 4,
        decoration: BoxDecoration(
          color: colors.mutedForeground.withAlpha(224),
          borderRadius: BorderRadius.circular(999),
        ),
      ),
    );
  }
}
