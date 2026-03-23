import 'package:flutter/widgets.dart';

class AppLatLng {
  const AppLatLng(this.latitude, this.longitude);

  final double latitude;
  final double longitude;
}

/// Contrato que toda implementação de mapa deve seguir.
/// Para trocar de lib: crie uma nova classe que implemente [AppMapWidget]
/// e atualize o [AppMapProvider] — o resto do app não muda.
abstract class AppMapWidget extends StatefulWidget {
  const AppMapWidget({
    super.key,
    required this.initialPosition,
    required this.initialZoom,
    this.currentPosition,
  });

  /// Centro inicial do mapa (ex: fallback regional).
  final AppLatLng initialPosition;
  final double initialZoom;
  final AppLatLng? currentPosition;
}
