import 'package:ibiapabaapp/shared/ui/maps/app_map.dart';
import 'package:ibiapabaapp/shared/ui/maps/flutter_map_widget.dart';

class AppMapProvider {
  AppMapProvider._();

  // deve ser chamado apenas UMA VEZ (ex: initState).
  static AppMapWidget create({
    required AppLatLng initialPosition,
    required double initialZoom,
    AppLatLng? currentPosition,
  }) {
    return FlutterMapWidget(
      initialPosition: initialPosition,
      initialZoom: initialZoom,
      currentPosition: currentPosition,
    );
  }

  /// Retorna uma cópia do widget com [currentPosition] atualizado.
  /// reutiliza o State existente via key — o controller NÃO é recriado.
  static AppMapWidget updatePosition(
    AppMapWidget current,
    AppLatLng? currentPosition,
  ) {
    if (current.currentPosition == currentPosition) return current;

    return FlutterMapWidget(
      key: current.key,
      initialPosition: current.initialPosition,
      initialZoom: current.initialZoom,
      currentPosition: currentPosition,
    );
  }
}
