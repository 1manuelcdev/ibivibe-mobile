import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:forui/forui.dart';
import 'package:ibiapabaapp/features/home/widgets/now_happening_section.dart';
import 'package:ibiapabaapp/features/home/widgets/quick_categories.dart';
import 'package:ibiapabaapp/features/home/widgets/sponsored_highlights.dart';
import 'package:ibiapabaapp/shared/ui/sheet_drag_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 16,
        children: [
          _HomeHeader(),
          QuickCategoriesList(),
          _MainWrapper(
            children: [SponsoredHighlights(), NowHappeningSection()],
          ),
        ],
      ),
    );
  }
}

class _MainWrapper extends StatelessWidget {
  final List<Widget> children;
  const _MainWrapper({required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .fromLTRB(16, 0, 16, 32),
      child: Column(spacing: 24, children: children),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  void showChangeLocationSheet({required BuildContext context}) {
    showFSheet(
      context: context,
      useSafeArea: true,
      side: .btt,
      builder: (context) => Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.theme.colors.background,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                const SheetDragIndicator(),
                const Text(
                  'Alternar cidade atual',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),

                FButton(
                  onPress: () => context.go('/welcome'),
                  style: FButtonStyle.destructive(),
                  prefix: const Icon(Icons.logout),
                  child: const Text('Logout'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .fromLTRB(16, 16, 16, 0),
      child: Row(
        mainAxisSize: .max,
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              const Text(
                'Ubajara, CE',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              FittedBox(
                fit: .fitWidth,
                child: FButton.raw(
                  onPress: () => showChangeLocationSheet(context: context),
                  style: FButtonStyle.ghost(),

                  child: Row(
                    mainAxisAlignment: .start,
                    crossAxisAlignment: .center,
                    spacing: 8,
                    children: [
                      Text(
                        'Alterar localização',
                        style: TextStyle(
                          fontSize: 14,
                          color: context.theme.colors.secondaryForeground,
                        ),
                      ),
                      Icon(
                        FIcons.chevronDown,
                        size: 14,
                        color: context.theme.colors.secondaryForeground,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          FButton.icon(
            onPress: () {},
            style: FButtonStyle.ghost(),
            child: Icon(FIcons.bell, size: 20),
          ),
        ],
      ),
    );
  }
}
