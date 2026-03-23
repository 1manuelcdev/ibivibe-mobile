// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authRemoteDatasource)
final authRemoteDatasourceProvider = AuthRemoteDatasourceProvider._();

final class AuthRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          AuthRemoteDatasourceImpl,
          AuthRemoteDatasourceImpl,
          AuthRemoteDatasourceImpl
        >
    with $Provider<AuthRemoteDatasourceImpl> {
  AuthRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<AuthRemoteDatasourceImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AuthRemoteDatasourceImpl create(Ref ref) {
    return authRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRemoteDatasourceImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRemoteDatasourceImpl>(value),
    );
  }
}

String _$authRemoteDatasourceHash() =>
    r'b484a51634f63672041f9242a72f467ba54cd754';

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

String _$authRepositoryHash() => r'dbf3efef85572c46ff32069cfe672d56d4f8f3c6';

@ProviderFor(loginWithEmail)
final loginWithEmailProvider = LoginWithEmailProvider._();

final class LoginWithEmailProvider
    extends $FunctionalProvider<LoginWithEmail, LoginWithEmail, LoginWithEmail>
    with $Provider<LoginWithEmail> {
  LoginWithEmailProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginWithEmailProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginWithEmailHash();

  @$internal
  @override
  $ProviderElement<LoginWithEmail> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginWithEmail create(Ref ref) {
    return loginWithEmail(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginWithEmail value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginWithEmail>(value),
    );
  }
}

String _$loginWithEmailHash() => r'4ad7a728f47774992c5e59db4f3258bdb42daf94';

@ProviderFor(registerWithEmail)
final registerWithEmailProvider = RegisterWithEmailProvider._();

final class RegisterWithEmailProvider
    extends
        $FunctionalProvider<
          RegisterWithEmail,
          RegisterWithEmail,
          RegisterWithEmail
        >
    with $Provider<RegisterWithEmail> {
  RegisterWithEmailProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registerWithEmailProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registerWithEmailHash();

  @$internal
  @override
  $ProviderElement<RegisterWithEmail> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RegisterWithEmail create(Ref ref) {
    return registerWithEmail(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RegisterWithEmail value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RegisterWithEmail>(value),
    );
  }
}

String _$registerWithEmailHash() => r'89198d0de849329ef792ad3d83f742477fa0322e';

@ProviderFor(getMe)
final getMeProvider = GetMeProvider._();

final class GetMeProvider extends $FunctionalProvider<GetMe, GetMe, GetMe>
    with $Provider<GetMe> {
  GetMeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMeHash();

  @$internal
  @override
  $ProviderElement<GetMe> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetMe create(Ref ref) {
    return getMe(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMe value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMe>(value),
    );
  }
}

String _$getMeHash() => r'37e9831cc401f63b6c9c4f65d7d7ee7e8537d397';

@ProviderFor(refreshTokens)
final refreshTokensProvider = RefreshTokensProvider._();

final class RefreshTokensProvider
    extends $FunctionalProvider<RefreshTokens, RefreshTokens, RefreshTokens>
    with $Provider<RefreshTokens> {
  RefreshTokensProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'refreshTokensProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$refreshTokensHash();

  @$internal
  @override
  $ProviderElement<RefreshTokens> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RefreshTokens create(Ref ref) {
    return refreshTokens(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RefreshTokens value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RefreshTokens>(value),
    );
  }
}

String _$refreshTokensHash() => r'0b3c51e0dffe4ccd5b93fde202126a8c970f8c2e';

@ProviderFor(checkUniqueAvailability)
final checkUniqueAvailabilityProvider = CheckUniqueAvailabilityProvider._();

final class CheckUniqueAvailabilityProvider
    extends
        $FunctionalProvider<
          CheckUniqueAvailability,
          CheckUniqueAvailability,
          CheckUniqueAvailability
        >
    with $Provider<CheckUniqueAvailability> {
  CheckUniqueAvailabilityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkUniqueAvailabilityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkUniqueAvailabilityHash();

  @$internal
  @override
  $ProviderElement<CheckUniqueAvailability> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CheckUniqueAvailability create(Ref ref) {
    return checkUniqueAvailability(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CheckUniqueAvailability value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CheckUniqueAvailability>(value),
    );
  }
}

String _$checkUniqueAvailabilityHash() =>
    r'c2e64eb16705b8880f6a489f5b7baff4f8e6d15f';

@ProviderFor(loginController)
final loginControllerProvider = LoginControllerProvider._();

final class LoginControllerProvider
    extends
        $FunctionalProvider<LoginController, LoginController, LoginController>
    with $Provider<LoginController> {
  LoginControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginControllerHash();

  @$internal
  @override
  $ProviderElement<LoginController> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginController create(Ref ref) {
    return loginController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginController>(value),
    );
  }
}

String _$loginControllerHash() => r'3a80ebce2b79090a0d6958ead38cee2459211aa3';

@ProviderFor(registerController)
final registerControllerProvider = RegisterControllerProvider._();

final class RegisterControllerProvider
    extends
        $FunctionalProvider<
          RegisterController,
          RegisterController,
          RegisterController
        >
    with $Provider<RegisterController> {
  RegisterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registerControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registerControllerHash();

  @$internal
  @override
  $ProviderElement<RegisterController> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RegisterController create(Ref ref) {
    return registerController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RegisterController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RegisterController>(value),
    );
  }
}

String _$registerControllerHash() =>
    r'86fce085b39103093131cd3891ebdf455f5773dc';
