import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:forui/forui.dart';

// ignore_for_file: unnecessary_ignore
// ignore_for_file: avoid_redundant_argument_values

FTileGroupStyle tileGroupStyle({
  required FColors colors,
  required FTypography typography,
  required FStyle style,
}) {
  final tileStyle = _tileStyle(
    colors: colors,
    typography: typography,
    style: style,
  );
  return .new(
    decoration: BoxDecoration(
      border: Border.all(color: colors.border, width: style.borderWidth),
      borderRadius: .circular(16),
    ),
    tileStyle: tileStyle.copyWith(
      decoration: tileStyle.decoration.map(
        (d) => d == null
            ? null
            : BoxDecoration(
                color: d.color,
                image: d.image,
                boxShadow: d.boxShadow,
                gradient: d.gradient,
                backgroundBlendMode: d.backgroundBlendMode,
                shape: d.shape,
              ),
      ),
    ),
    dividerColor: .all(colors.border),
    dividerWidth: style.borderWidth,
    labelTextStyle: FWidgetStateMap({
      WidgetState.error: typography.base.copyWith(
        color:
            style.formFieldStyle.labelTextStyle.maybeResolve({})?.color ??
            colors.primary,
        fontWeight: .w400,
      ),
      WidgetState.disabled: typography.base.copyWith(
        color:
            style.formFieldStyle.labelTextStyle.maybeResolve({
              WidgetState.disabled,
            })?.color ??
            colors.disable(colors.primary),
        fontWeight: .w400,
      ),
      WidgetState.any: typography.base.copyWith(
        color:
            style.formFieldStyle.labelTextStyle.maybeResolve({})?.color ??
            colors.primary,
        fontWeight: .w400,
      ),
    }),
    descriptionTextStyle: style.formFieldStyle.descriptionTextStyle.map(
      (s) => typography.xs.copyWith(color: s.color),
    ),
    errorTextStyle: typography.xs.copyWith(
      color: style.formFieldStyle.errorTextStyle.color,
    ),
    labelPadding: .fromSTEB(0, 0, 0, 10),
  );
}

FTileStyle _tileStyle({
  required FColors colors,
  required FTypography typography,
  required FStyle style,
}) => FTileStyle(
  backgroundColor: .all(colors.background),
  decoration: FWidgetStateMap({
    WidgetState.disabled: BoxDecoration(
      color: colors.disable(colors.secondary),
      border: .all(color: colors.border),
      borderRadius: style.borderRadius,
    ),
    WidgetState.hovered | WidgetState.pressed: BoxDecoration(
      color: colors.secondary,
      border: .all(color: colors.border),
      borderRadius: style.borderRadius,
    ),
    WidgetState.any: BoxDecoration(
      color: colors.background,
      border: .all(color: colors.border),
      borderRadius: style.borderRadius,
    ),
  }),
  contentStyle: FItemContentStyle(
    padding: const .fromSTEB(16, 14, 10, 14),
    prefixIconSpacing: 12,
    prefixIconStyle: FWidgetStateMap({
      WidgetState.disabled: IconThemeData(
        color: colors.disable(colors.foreground),
        size: 18,
      ),
      WidgetState.any: IconThemeData(color: colors.foreground, size: 18),
    }),
    titleTextStyle: FWidgetStateMap({
      WidgetState.disabled: typography.sm.copyWith(
        color: colors.disable(colors.primary),
      ),
      WidgetState.any: typography.sm,
    }),
    subtitleTextStyle: FWidgetStateMap({
      WidgetState.disabled: typography.xs.copyWith(
        color: colors.disable(colors.mutedForeground),
      ),
      WidgetState.any: typography.xs.copyWith(color: colors.mutedForeground),
    }),
    detailsTextStyle: FWidgetStateMap({
      WidgetState.disabled: typography.base.copyWith(
        color: colors.disable(colors.mutedForeground),
      ),
      WidgetState.any: typography.base.copyWith(color: colors.mutedForeground),
    }),
    suffixIconStyle: FWidgetStateMap({
      WidgetState.disabled: IconThemeData(
        color: colors.disable(colors.mutedForeground),
        size: 18,
      ),
      WidgetState.any: IconThemeData(color: colors.mutedForeground, size: 18),
    }),
  ),
  rawItemContentStyle: FRawItemContentStyle(
    padding: const .fromSTEB(16, 14, 10, 14),
    prefixIconStyle: FWidgetStateMap({
      WidgetState.disabled: IconThemeData(
        color: colors.disable(colors.primary),
        size: 18,
      ),
      WidgetState.any: IconThemeData(color: colors.primary, size: 18),
    }),
    childTextStyle: FWidgetStateMap({
      WidgetState.disabled: typography.base.copyWith(
        color: colors.disable(colors.primary),
      ),
      WidgetState.any: typography.base,
    }),
  ),
  tappableStyle: style.tappableStyle.copyWith(
    motion: FTappableMotion.none.call,
    pressedEnterDuration: .zero,
    pressedExitDuration: const Duration(milliseconds: 25),
  ),
  focusedOutlineStyle: style.focusedOutlineStyle,
  margin: EdgeInsets.zero,
);
