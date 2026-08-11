import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class TagBadge extends StatelessWidget {
  final String label;

  const TagBadge({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return FBadge(
      style: FBadgeStyle.secondary(
        (style) => style.copyWith(
          decoration: style.decoration.copyWith(
            color: context.theme.colors.muted,
            border: Border.all(
              color: context.theme.colors.border.withAlpha(150),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          contentStyle: (contentStyle) => contentStyle.copyWith(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          ),
        ),
      ),
      child: Text(
        label,
        style: context.theme.typography.xs.copyWith(
          color: context.theme.colors.foreground,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
