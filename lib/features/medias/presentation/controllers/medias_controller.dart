import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ibiapabaapp/features/auth/presentation/providers/session_provider.dart';
import 'package:ibiapabaapp/features/medias/domain/entity/media.dart';
import 'package:ibiapabaapp/features/medias/presentation/providers/medias_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'medias_controller.g.dart';

// TODO: implementar ControllerLogHandler
@riverpod
class EntityMedias extends _$EntityMedias {
  @override
  Future<List<Media>> build(EntityType entityType, String entityId) async {
    final session = ref.watch(sessionProvider.select((s) => s));
    if (session == null) return [];

    return _fetchRemote(entityType, entityId);
  }

  Future<List<Media>> _fetchRemote(
    EntityType entityType,
    String entityId,
  ) async {
    final getEntityMedia = ref.read(getEntityMediaProvider);
    final result = await getEntityMedia(
      entityType: entityType,
      entityId: entityId,
    );

    return result.fold(
      (failure) => throw Exception(failure.message),
      (media) => media,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchRemote(entityType, entityId));
  }
}
