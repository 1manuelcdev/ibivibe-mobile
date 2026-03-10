import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ibiapabaapp/core/errors/failures/failures.dart';
import 'package:ibiapabaapp/core/logger/logger.dart';
import 'package:ibiapabaapp/features/auth/presentation/providers/session_provider.dart';
import 'package:ibiapabaapp/features/cities/domain/entities/city.dart';
import 'package:ibiapabaapp/features/cities/domain/entities/city_detail_data.dart';
import 'package:ibiapabaapp/features/cities/presentation/providers/cities_providers.dart';
import 'package:ibiapabaapp/features/medias/domain/entity/media.dart';
import 'package:ibiapabaapp/features/medias/presentation/providers/medias_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'city_detail_controller.g.dart';

@riverpod
class CityDetail extends _$CityDetail {
  @override
  Future<CityDetailData?> build(String id) async {
    final session = ref.watch(sessionProvider.select((s) => s));
    if (session == null) return null;

    final results = await Future.wait([
      ref.read(getCityByIdProvider).call(id),
      ref
          .read(getEntityMediaProvider)
          .call(entityType: EntityType.city, entityId: id),
    ]);

    final cityResult = results[0] as Either<Failure, City?>;
    final mediaResult = results[1] as Either<Failure, List<Media>>;

    final city = cityResult.fold(
      (failure) => throw Exception(failure.message),
      (city) => city,
    );

    if (city == null) return null;

    final media = mediaResult.fold((failure) {
      logger.w('Falha ao carregar mídia da cidade $id: ${failure.message}');
      return <Media>[];
    }, (media) => media);

    return CityDetailData(city: city, media: media);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    // ref.invalidateSelf() força o build() a reexecutar corretamente
    ref.invalidateSelf();
    await future;
  }
}
