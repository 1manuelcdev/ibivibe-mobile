// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_session_storage_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appSessionStorage)
final appSessionStorageProvider = AppSessionStorageProvider._();

final class AppSessionStorageProvider
    extends
        $FunctionalProvider<
          AppSessionStorage,
          AppSessionStorage,
          AppSessionStorage
        >
    with $Provider<AppSessionStorage> {
  AppSessionStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appSessionStorageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appSessionStorageHash();

  @$internal
  @override
  $ProviderElement<AppSessionStorage> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AppSessionStorage create(Ref ref) {
    return appSessionStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppSessionStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppSessionStorage>(value),
    );
  }
}

String _$appSessionStorageHash() => r'3d1908ffb6692bd42026851b6adafc87315e1f35';
