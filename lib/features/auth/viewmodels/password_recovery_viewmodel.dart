import 'package:flutter/foundation.dart';
import 'package:ibivibe/core/errors/failures/failures.dart';
import 'package:ibivibe/features/auth/auth_repository.dart';
import 'package:ibivibe/features/auth/password_recovery_state.dart';

class PasswordRecoveryViewModel extends ChangeNotifier {
  final AuthRepository repository;

  PasswordRecoveryViewModel({required this.repository});

  PasswordRecoveryState _state = const PasswordRecoveryState();
  PasswordRecoveryState get state => _state;

  Future<void> requestReset({required String email}) async {
    _setState(
      _state.copyWith(status: PasswordRecoveryStatus.loading, clearError: true),
    );

    try {
      await repository.requestPasswordReset(email: email);
      _setState(
        _state.copyWith(
          status: PasswordRecoveryStatus.requestSent,
          clearError: true,
        ),
      );
    } catch (e) {
      _setState(
        _state.copyWith(
          status: PasswordRecoveryStatus.error,
          errorMessage: e is AppFailure ? e.message : 'Erro inesperado',
        ),
      );
    }
  }

  Future<void> resetPassword({
    required String token,
    required String password,
    required String passwordConfirmation,
  }) async {
    _setState(
      _state.copyWith(status: PasswordRecoveryStatus.loading, clearError: true),
    );

    try {
      await repository.resetPassword(
        token: token,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );
      _setState(
        _state.copyWith(
          status: PasswordRecoveryStatus.success,
          clearError: true,
        ),
      );
    } catch (e) {
      _setState(
        _state.copyWith(
          status: PasswordRecoveryStatus.error,
          errorMessage: e is AppFailure ? e.message : 'Erro inesperado',
        ),
      );
    }
  }

  void _setState(PasswordRecoveryState next) {
    _state = next;
    notifyListeners();
  }
}
