import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:ibiapabaapp/core/session/app_session_notifier_provider.dart';
import 'package:ibiapabaapp/shared/ui/fragments/toast/show_app_toast.dart';
import 'package:ibiapabaapp/shared/ui/layout/sheet_drag_indicator.dart';
import 'package:ibiapabaapp/shared/ui/maps/app_map.dart';
import 'package:ibiapabaapp/shared/ui/maps/app_map_provider.dart';

void showChangeLocationSheet({required BuildContext context}) {
  showModalBottomSheet(
    useRootNavigator: true,
    isScrollControlled: true,
    context: context,
    barrierColor: Colors.black45,
    isDismissible: true,
    builder: (context) => const _ChangeLocationSheet(),
  );
}

class _ChangeLocationSheet extends ConsumerStatefulWidget {
  const _ChangeLocationSheet();

  @override
  ConsumerState<_ChangeLocationSheet> createState() =>
      _ChangeLocationSheetState();
}

class _ChangeLocationSheetState extends ConsumerState<_ChangeLocationSheet> {
  bool _loadingLocation = false;
  String? _locationError;

  static const _fallbackPosition = AppLatLng(-3.9248, -40.8868);

  // Widget de mapa criado UMA VEZ — nunca recriado em rebuilds
  late final AppMapWidget _mapWidget;

  @override
  void initState() {
    super.initState();

    // Lê a posição já disponível em sessão antes de montar o mapa —
    // evita o "pulo" de fallback → posição real na segunda abertura
    final sessionPos = ref.read(appSessionProvider).devicePosition;
    final initialPos = sessionPos != null
        ? AppLatLng(sessionPos.latitude, sessionPos.longitude)
        : _fallbackPosition;

    _mapWidget = AppMapProvider.create(
      initialPosition: initialPos,
      initialZoom: sessionPos != null ? 15.0 : 13.0,
      currentPosition: sessionPos != null ? initialPos : null,
    );

    // Resolve posição silenciosamente se ainda não foi obtida nesta sessão
    // Se já existir em session, retorna imediatamente sem chamar o GPS
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(appSessionProvider.notifier).resolveDevicePosition();
    });
  }

  Future<void> _detectNearestCity() async {
    setState(() {
      _loadingLocation = true;
      _locationError = null;
    });

    final navigator = Navigator.of(context, rootNavigator: true);
    final previousCity = ref.read(appSessionProvider).currentCity;

    final failure = await ref
        .read(appSessionProvider.notifier)
        .detectAndSetNearestCity();
    // detectAndSetNearestCity já chama resolveDevicePosition(force: true) internamente

    if (!mounted) return;

    if (failure != null) {
      setState(() {
        _loadingLocation = false;
        _locationError = failure.message;
      });
    } else {
      setState(() => _loadingLocation = false);
      navigator.pop();

      final newCity = ref.read(appSessionProvider).currentCity;
      final cityChanged = newCity != null && newCity.id != previousCity?.id;

      showAppToast(
        alignment: .bottomCenter,
        context: context,
        icon: Icon(
          cityChanged ? Icons.location_on : Icons.location_on_outlined,
        ),
        title: Text(
          cityChanged ? 'Localização atualizada' : 'Localização confirmada',
        ),
        description: Text(
          cityChanged
              ? 'Você agora está em ${newCity.name}'
              : 'Você continua em ${newCity?.name ?? ', sua cidade atual'}',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    // Lê direto do appSessionProvider — zero overhead, sem provider extra
    final session = ref.watch(appSessionProvider);
    final devicePos = session.devicePosition;
    final currentPosition = devicePos != null
        ? AppLatLng(devicePos.latitude, devicePos.longitude)
        : null;

    // Mostra overlay de loading apenas na primeira vez (posição ainda null e
    // ainda não houve nenhum valor resolvido)
    final isLoadingMap =
        currentPosition == null &&
        ref.watch(appSessionProvider.select((s) => s.devicePosition == null));

    final mapWithPosition = AppMapProvider.updatePosition(
      _mapWidget,
      currentPosition,
    );

    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.72,
        decoration: BoxDecoration(
          color: theme.colors.background,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: const SheetDragIndicator()),
              const SizedBox(height: 16),

              // ── Header ────────────────────────────────────────────────────
              _SheetHeader(),
              const SizedBox(height: 12),

              // ── Mapa ──────────────────────────────────────────────────────
              _SheetMap(
                isLoadingMap: isLoadingMap,
                mapWithPosition: mapWithPosition,
              ),
              const SizedBox(height: 12),

              // ── Botões ────────────────────────────────────────────────────
              _SheetActions(
                isLoadingLocation: _loadingLocation,
                detectNearestCity: _detectNearestCity,
              ),

              // ── Erro ──────────────────────────────────────────────────────
              if (_locationError != null) ...[
                const SizedBox(height: 8),
                Text(
                  _locationError!,
                  style: theme.typography.sm.copyWith(
                    color: theme.colors.destructive,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 24),

              // ── Locais recentes ───────────────────────────────────────────
              Text(
                'Locais recentes',
                style: theme.typography.lg.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              _RecentLocationsList(theme: theme),
            ],
          ),
        ),
      ),
    );
  }
}

class _RecentLocationsList extends StatelessWidget {
  final FThemeData theme;
  const _RecentLocationsList({required this.theme});

  static const _recentLocations = ['Tianguá', 'Ubajara', 'Croatá'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colors.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colors.border, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _recentLocations.length,
          separatorBuilder: (_, _) =>
              Divider(height: 1, thickness: 1, color: theme.colors.border),
          itemBuilder: (context, index) {
            final city = _recentLocations[index];
            return ListTile(
              leading: Icon(
                Icons.location_on_outlined,
                color: theme.colors.mutedForeground,
                size: 20,
              ),
              title: Text(
                city,
                style: theme.typography.sm.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: theme.colors.mutedForeground,
                size: 18,
              ),
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}

class _SheetHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Alterar localização',
          style: context.theme.typography.lg.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.settings_outlined),
          onPressed: () {},
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ],
    );
  }
}

class _SheetMap extends StatelessWidget {
  final AppMapWidget mapWithPosition;
  final bool isLoadingMap;

  const _SheetMap({required this.isLoadingMap, required this.mapWithPosition});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 180,
        child: Stack(
          children: [
            mapWithPosition,
            if (isLoadingMap)
              Positioned.fill(
                child: ColoredBox(
                  color: context.theme.colors.muted,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: context.theme.colors.primary,
                      strokeWidth: 2,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _SheetActions extends StatelessWidget {
  final bool isLoadingLocation;
  final VoidCallback detectNearestCity;

  const _SheetActions({
    required this.isLoadingLocation,
    required this.detectNearestCity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FButton(
            onPress: isLoadingLocation ? null : detectNearestCity,
            style: FButtonStyle.primary(),
            prefix: isLoadingLocation
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : null,
            child: Text(isLoadingLocation ? 'Detectando...' : 'Me localize'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: FButton(
            onPress: () {},
            style: FButtonStyle.secondary(),
            child: const Text('Editar'),
          ),
        ),
      ],
    );
  }
}
