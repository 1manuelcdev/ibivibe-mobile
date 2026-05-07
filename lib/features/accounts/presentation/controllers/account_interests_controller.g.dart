// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_interests_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AccountInterestsController)
final accountInterestsControllerProvider =
    AccountInterestsControllerProvider._();

final class AccountInterestsControllerProvider
    extends
        $NotifierProvider<AccountInterestsController, AccountInterestsState> {
  AccountInterestsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accountInterestsControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accountInterestsControllerHash();

  @$internal
  @override
  AccountInterestsController create() => AccountInterestsController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AccountInterestsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AccountInterestsState>(value),
    );
  }
}

String _$accountInterestsControllerHash() =>
    r'f6779e5c5eacc5cb1beaed842de2c9f9ca2ebfc9';

abstract class _$AccountInterestsController
    extends $Notifier<AccountInterestsState> {
  AccountInterestsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AccountInterestsState, AccountInterestsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AccountInterestsState, AccountInterestsState>,
              AccountInterestsState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
