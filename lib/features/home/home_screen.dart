import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:ibiapabaapp/features/home/widgets/sheets/change_location_sheet.dart';
import 'package:ibiapabaapp/features/home/widgets/now_happening_section.dart';
import 'package:ibiapabaapp/features/home/widgets/quick_categories.dart';
import 'package:ibiapabaapp/features/home/widgets/sponsored_highlights.dart';

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
      padding: .fromLTRB(24, 0, 24, 32),
      child: Column(spacing: 24, children: children),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .fromLTRB(24, 16, 24, 0),
      child: Row(
        mainAxisSize: .max,
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            spacing: 8,
            children: [
              FButton.raw(
                onPress: () => showChangeLocationSheet(context: context),
                style: FButtonStyle.ghost(),
                child: FTooltip(
                  tipAnchor: Alignment.topLeft,
                  spacing: FPortalSpacing(12),
                  childAnchor: Alignment.bottomLeft,
                  hover: true,
                  longPress: true,
                  tipBuilder: (context, _) =>
                      const Text('Localização atual, toque para mudar'),
                  child: Row(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .center,
                    spacing: 4,
                    children: [
                      const Text(
                        'Ubajara, CE',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        FIcons.chevronDown,
                        weight: 2,
                        size: 16,
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
