sealed class LocationException implements Exception {
  const LocationException(this.message);
  final String message;
}

class LocationPermissionDeniedException extends LocationException {
  const LocationPermissionDeniedException()
    : super('Permissão de localização negada.');
}

class LocationPermissionPermanentlyDeniedException extends LocationException {
  const LocationPermissionPermanentlyDeniedException()
    : super(
        'Permissão de localização negada permanentemente. Acesse as configurações do app.',
      );
}

class LocationDisabledException extends LocationException {
  const LocationDisabledException()
    : super('Serviço de localização desativado no dispositivo.');
}

class LocationTimeoutException extends LocationException {
  const LocationTimeoutException()
    : super('Tempo esgotado ao obter a localização.');
}

class LocationUnknownException extends LocationException {
  const LocationUnknownException(super.message);
}
