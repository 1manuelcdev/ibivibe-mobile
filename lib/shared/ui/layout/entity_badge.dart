import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:ibiapabaapp/features/medias/domain/entity/media.dart';
import 'package:ibiapabaapp/shared/utils/get_entity_icon.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EntityBadge extends StatelessWidget {
  final EntityType type;
  const EntityBadge({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Skeleton.ignore(
      ignore: true,
      child: Container(
        padding: .all(4),
        decoration: BoxDecoration(
          borderRadius: .circular(6),
          color: context.theme.colors.background,
        ),
        child: Icon(
          getEntityIcon(type),
          size: 16,
          color: context.theme.colors.foreground,
        ),
      ),
    );
  }
}
