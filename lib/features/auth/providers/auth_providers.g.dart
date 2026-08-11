// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authRepository)
final authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'cf957c53ffaa90803dd5e9adfae998770964ac9a';

@ProviderFor(loginViewModel)
final loginViewModelProvider = LoginViewModelProvider._();

final class LoginViewModelProvider
    extends $FunctionalProvider<LoginViewModel, LoginViewModel, LoginViewModel>
    with $Provider<LoginViewModel> {
  LoginViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginViewModelHash();

  @$internal
  @override
  $ProviderElement<LoginViewModel> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginViewModel create(Ref ref) {
    return loginViewModel(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginViewModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginViewModel>(value),
    );
  }
}

String _$loginViewModelHash() => r'5562ec11a7054b2078035fcc06e78fcd56ac1b72';

@ProviderFor(passwordRecoveryViewModel)
final passwordRecoveryViewModelProvider = PasswordRecoveryViewModelProvider._();

final class PasswordRecoveryViewModelProvider
    extends
        $FunctionalProvider<
          PasswordRecoveryViewModel,
          PasswordRecoveryViewModel,
          PasswordRecoveryViewModel
        >
    with $Provider<PasswordRecoveryViewModel> {
  PasswordRecoveryViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'passwordRecoveryViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$passwordRecoveryViewModelHash();

  @$internal
  @override
  $ProviderElement<PasswordRecoveryViewModel> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PasswordRecoveryViewModel create(Ref ref) {
    return passwordRecoveryViewModel(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PasswordRecoveryViewModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PasswordRecoveryViewModel>(value),
    );
  }
}

String _$passwordRecoveryViewModelHash() =>
    r'82ccb69b783587a6c51c7ab27c3e99196e4c9a4b';
