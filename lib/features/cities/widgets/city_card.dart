import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:ibivibe/core/entities/entity_type.dart';
import 'package:ibivibe/shared/models/city.dart';
import 'package:ibivibe/shared/ui/fragments/media/content_media.dart';
import 'package:ibivibe/shared/ui/fragments/media/sources.dart';
import 'package:ibivibe/shared/ui/layout/entity_badge.dart';
import 'package:ibivibe/shared/ui/layout/tag_badge.dart';
import 'package:ibivibe/shared/utils/get_entity_icon.dart';

class CityCard extends StatelessWidget {
  final City city;
  const CityCard({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/app/cities/${city.id}'),
      child: FCard(
        style: (style) => style.copyWith(
          contentStyle: (s) => s.copyWith(padding: const EdgeInsets.all(12)),
          decoration: style.decoration.copyWith(
            border: Border.all(
              width: 1,
              color: context.theme.colors.border.withAlpha(190),
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 140,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  children: [
                    getCityImage(
                      context: context,
                      coverImgUrl: city.coverImgUrl,
                    ),
                    const Positioned(
                      top: 8,
                      left: 8,
                      child: EntityBadge(type: EntityType.city),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              city.name,
              style: context.theme.typography.base.copyWith(fontWeight: .w500),
            ),
            const SizedBox(height: 8),
            Wrap(
              runSpacing: 6,
              spacing: 6,
              clipBehavior: .hardEdge,
              children: [
                ...city.tags.map((cat) => TagBadge(label: cat)).take(3),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget getCityImage({
  required BuildContext context,
  String? coverImgUrl,
  Widget? fallback,
}) {
  final errorPlaceholder =
      fallback ?? const _DefaultErrorPlaceholder(height: 140);

  if (coverImgUrl == null ||
      coverImgUrl.isEmpty ||
      !coverImgUrl.startsWith('http')) {
    return errorPlaceholder;
  }

  return ContentMedia(
    source: NetworkMedia(url: coverImgUrl),
    fit: BoxFit.cover,
    errorWidget: errorPlaceholder,
  );
}

class _DefaultErrorPlaceholder extends StatelessWidget {
  final double height;
  const _DefaultErrorPlaceholder({required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.theme.colors.background,
      ),
      width: double.infinity,
      height: height,
      alignment: Alignment.center,
      child: Icon(
        getEntityIcon(EntityType.city),
        size: 48,
        color: context.theme.colors.mutedForeground,
      ),
    );
  }
}
