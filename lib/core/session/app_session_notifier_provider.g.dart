// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_session_notifier_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppSessionNotifier)
final appSessionProvider = AppSessionNotifierProvider._();

final class AppSessionNotifierProvider
    extends $NotifierProvider<AppSessionNotifier, AppSession> {
  AppSessionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appSessionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appSessionNotifierHash();

  @$internal
  @override
  AppSessionNotifier create() => AppSessionNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppSession value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppSession>(value),
    );
  }
}

String _$appSessionNotifierHash() =>
    r'cbf6ac6a30ffd418867980a15cc41eed4c7cdcd9';

abstract class _$AppSessionNotifier extends $Notifier<AppSession> {
  AppSession build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AppSession, AppSession>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppSession, AppSession>,
              AppSession,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(isAuthenticated)
final isAuthenticatedProvider = IsAuthenticatedProvider._();

final class IsAuthenticatedProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  IsAuthenticatedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isAuthenticatedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isAuthenticatedHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isAuthenticated(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isAuthenticatedHash() => r'0f1fb89af493395c8cbcbfbd572aa4a02ecf80f3';

@ProviderFor(currentCity)
final currentCityProvider = CurrentCityProvider._();

final class CurrentCityProvider extends $FunctionalProvider<City?, City?, City?>
    with $Provider<City?> {
  CurrentCityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentCityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentCityHash();

  @$internal
  @override
  $ProviderElement<City?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  City? create(Ref ref) {
    return currentCity(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(City? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<City?>(value),
    );
  }
}

String _$currentCityHash() => r'0b0a00ebc1d9cdfd737ac6dbd7c5c975bad190f7';
