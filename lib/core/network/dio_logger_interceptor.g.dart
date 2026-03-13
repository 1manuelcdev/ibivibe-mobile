// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_logger_interceptor.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dioLoggerInterceptor)
final dioLoggerInterceptorProvider = DioLoggerInterceptorProvider._();

final class DioLoggerInterceptorProvider
    extends
        $FunctionalProvider<
          DioLoggerInterceptor,
          DioLoggerInterceptor,
          DioLoggerInterceptor
        >
    with $Provider<DioLoggerInterceptor> {
  DioLoggerInterceptorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioLoggerInterceptorProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioLoggerInterceptorHash();

  @$internal
  @override
  $ProviderElement<DioLoggerInterceptor> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DioLoggerInterceptor create(Ref ref) {
    return dioLoggerInterceptor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DioLoggerInterceptor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DioLoggerInterceptor>(value),
    );
  }
}

String _$dioLoggerInterceptorHash() =>
    r'c7c2c53756f99adf8dff4e7130ab23a49e08b9c3';
