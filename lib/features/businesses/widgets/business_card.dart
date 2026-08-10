import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:ibivibe/shared/models/business.dart';
import 'package:ibivibe/shared/ui/fragments/media/content_media.dart';
import 'package:ibivibe/shared/ui/fragments/media/sources.dart';
import 'package:ibivibe/shared/ui/layout/entity_badge.dart';
import 'package:ibivibe/shared/utils/get_entity_icon.dart';

class BusinessCard extends StatelessWidget {
  final Business business;
  const BusinessCard({super.key, required this.business});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/app/businesses/${business.id}'),
      child: FCard(
        style: (style) => style.copyWith(
          contentStyle: (s) => s.copyWith(padding: const EdgeInsets.all(12)),
          decoration: style.decoration.copyWith(
            color: context.theme.colors.secondary,
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
                    getBusinessImage(
                      context: context,
                      coverImgUrl: business.avatar,
                    ),
                    const Positioned(
                      top: 8,
                      left: 8,
                      child: EntityBadge(type: .business),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              business.name,
              style: context.theme.typography.base.copyWith(fontWeight: .w500),
              maxLines: 1,
              overflow: .ellipsis,
            ),
            const SizedBox(height: 8),
            Wrap(
              runSpacing: 6,
              spacing: 6,
              children: [
                ...business.tags
                    .map(
                      (cat) => FBadge(
                        style: FBadgeStyle.secondary(),
                        child: Text(
                          cat,
                          style: context.theme.typography.xs.copyWith(
                            fontWeight: .normal,
                          ),
                        ),
                      ),
                    )
                    .take(2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget getBusinessImage({
  required BuildContext context,
  String? coverImgUrl,
  Widget? fallback,
}) {
  final errorPlaceholder =
      fallback ?? const _DefaultErrorPlaceholder(height: 140);

  if (coverImgUrl == null || coverImgUrl.isEmpty) {
    return errorPlaceholder;
  }

  final source = NetworkMedia(url: coverImgUrl);

  return SizedBox(
    height: 140,
    width: double.infinity,
    child: ContentMedia(
      source: source,
      fit: BoxFit.cover,
      errorWidget: errorPlaceholder,
    ),
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
        color: context.theme.colors.muted,
      ),
      width: double.infinity,
      height: height,
      alignment: Alignment.center,
      child: Icon(
        getEntityIcon(.business),
        size: 48,
        color: context.theme.colors.mutedForeground,
      ),
    );
  }
}
