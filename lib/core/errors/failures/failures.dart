abstract class Failure {
  final String message;
  final String code;
  const Failure({required this.message, required this.code});
}

class ServerFailure extends Failure {
  const ServerFailure(String message)
    : super(message: message, code: 'server_error');
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(String message, {required super.code})
    : super(message: message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message, {required super.code})
    : super(message: message);
}

class BadRequestFailure extends Failure {
  const BadRequestFailure(String message, {required super.code})
    : super(message: message);
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure(String message, {required super.code})
    : super(message: message);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(String message, {required super.code})
    : super(message: message);
}

class LocationPermissionDeniedFailure extends Failure {
  const LocationPermissionDeniedFailure()
    : super(
        message: 'Permissão de localização negada.',
        code: 'location_permission_denied',
      );
}

class LocationPermissionPermanentlyDeniedFailure extends Failure {
  const LocationPermissionPermanentlyDeniedFailure()
    : super(
        message: 'Permissão negada permanentemente. Acesse as configurações.',
        code: 'location_permission_denied_permanently',
      );
}

class LocationDisabledFailure extends Failure {
  const LocationDisabledFailure()
    : super(
        message: 'Serviço de localização desativado.',
        code: 'location_service_disabled',
      );
}

class LocationTimeoutFailure extends Failure {
  const LocationTimeoutFailure()
    : super(
        message: 'Tempo esgotado ao obter a localização.',
        code: 'location_service_timeout',
      );
}

class LocationUnknownFailure extends Failure {
  const LocationUnknownFailure(String message)
    : super(message: message, code: 'location_service_unknown_error');
}
