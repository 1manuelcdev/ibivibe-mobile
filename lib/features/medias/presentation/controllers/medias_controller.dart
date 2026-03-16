import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ibiapabaapp/core/logger/handlers/controller_log_handler.dart';
import 'package:ibiapabaapp/core/logger/log_tags.dart';
import 'package:ibiapabaapp/core/logger/logger.dart';
import 'package:ibiapabaapp/features/auth/presentation/providers/session_provider.dart';
import 'package:ibiapabaapp/features/medias/domain/entity/media.dart';
import 'package:ibiapabaapp/features/medias/presentation/providers/medias_providers.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'medias_controller.g.dart';

@riverpod
class EntityMedias extends _$EntityMedias with ControllerLogHandler {
  @override
  Logger get logger => ref.read(loggerProvider);

  @override
  LogFeature get feature => LogFeature.medias;

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
      (failure) {
        logControllerError(
          action: MediaAction.getEntityMedia,
          failure: failure,
        );
        throw Exception(failure.message);
      },
      (media) {
        logControllerSuccess(action: MediaAction.getEntityMedia);
        return media;
      },
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchRemote(entityType, entityId));
  }
}
