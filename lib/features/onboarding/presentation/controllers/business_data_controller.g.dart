// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_data_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BusinessDataController)
final businessDataControllerProvider = BusinessDataControllerProvider._();

final class BusinessDataControllerProvider
    extends $AsyncNotifierProvider<BusinessDataController, BusinessDataState> {
  BusinessDataControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'businessDataControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$businessDataControllerHash();

  @$internal
  @override
  BusinessDataController create() => BusinessDataController();
}

String _$businessDataControllerHash() =>
    r'3930283af652631f536d2adde7e112cc739a36e1';

abstract class _$BusinessDataController
    extends $AsyncNotifier<BusinessDataState> {
  FutureOr<BusinessDataState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<BusinessDataState>, BusinessDataState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<BusinessDataState>, BusinessDataState>,
              AsyncValue<BusinessDataState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
