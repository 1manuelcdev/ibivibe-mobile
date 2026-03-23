import 'package:flutter/material.dart';
import 'package:ibiapabaapp/features/medias/domain/entity/media.dart';

IconData getEntityIcon(EntityType type) {
  switch (type) {
    case EntityType.city:
      return Icons.pin_drop_rounded;
    case EntityType.company:
      return Icons.store_rounded;
    case EntityType.event:
      return Icons.event_rounded;
  }
}
