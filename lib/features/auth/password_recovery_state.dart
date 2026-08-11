enum PasswordRecoveryStatus { initial, loading, requestSent, success, error }

class PasswordRecoveryState {
  final PasswordRecoveryStatus status;
  final String? errorMessage;

  const PasswordRecoveryState({
    this.status = PasswordRecoveryStatus.initial,
    this.errorMessage,
  });

  PasswordRecoveryState copyWith({
    PasswordRecoveryStatus? status,
    String? errorMessage,
    bool clearError = false,
  }) {
    return PasswordRecoveryState(
      status: status ?? this.status,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}
