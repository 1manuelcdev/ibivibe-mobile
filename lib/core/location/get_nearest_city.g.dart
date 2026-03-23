// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_nearest_city.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getNearestCity)
final getNearestCityProvider = GetNearestCityProvider._();

final class GetNearestCityProvider
    extends $FunctionalProvider<GetNearestCity, GetNearestCity, GetNearestCity>
    with $Provider<GetNearestCity> {
  GetNearestCityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getNearestCityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getNearestCityHash();

  @$internal
  @override
  $ProviderElement<GetNearestCity> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetNearestCity create(Ref ref) {
    return getNearestCity(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetNearestCity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetNearestCity>(value),
    );
  }
}

String _$getNearestCityHash() => r'7e35112bf7312760a4925c008995a3e58377ca7b';
