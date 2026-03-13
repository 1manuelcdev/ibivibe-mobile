// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medias_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mediasRemoteDatasource)
final mediasRemoteDatasourceProvider = MediasRemoteDatasourceProvider._();

final class MediasRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          MediasRemoteDatasource,
          MediasRemoteDatasource,
          MediasRemoteDatasource
        >
    with $Provider<MediasRemoteDatasource> {
  MediasRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mediasRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mediasRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<MediasRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MediasRemoteDatasource create(Ref ref) {
    return mediasRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MediasRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MediasRemoteDatasource>(value),
    );
  }
}

String _$mediasRemoteDatasourceHash() =>
    r'35ee5f6f39ca0b5e5fa0750566de4fcce18b9dc8';

@ProviderFor(mediasRepository)
final mediasRepositoryProvider = MediasRepositoryProvider._();

final class MediasRepositoryProvider
    extends
        $FunctionalProvider<
          MediasRepository,
          MediasRepository,
          MediasRepository
        >
    with $Provider<MediasRepository> {
  MediasRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mediasRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mediasRepositoryHash();

  @$internal
  @override
  $ProviderElement<MediasRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MediasRepository create(Ref ref) {
    return mediasRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MediasRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MediasRepository>(value),
    );
  }
}

String _$mediasRepositoryHash() => r'7cc921743f9826cb0ba21a1eefa71261cbc5e067';

@ProviderFor(getEntityMedia)
final getEntityMediaProvider = GetEntityMediaProvider._();

final class GetEntityMediaProvider
    extends $FunctionalProvider<GetEntityMedia, GetEntityMedia, GetEntityMedia>
    with $Provider<GetEntityMedia> {
  GetEntityMediaProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getEntityMediaProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getEntityMediaHash();

  @$internal
  @override
  $ProviderElement<GetEntityMedia> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetEntityMedia create(Ref ref) {
    return getEntityMedia(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetEntityMedia value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetEntityMedia>(value),
    );
  }
}

String _$getEntityMediaHash() => r'73e9c21c97101f1bf18790925b4bd8510891b1ca';
