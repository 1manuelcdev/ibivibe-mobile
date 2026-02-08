import 'package:flutter/services.dart';
import 'package:forui/forui.dart';
import 'package:flutter/material.dart';
import 'package:ibiapabaapp/app/theme/text_field_style.dart';

const brandPrimaryLight = Color.fromARGB(255, 55, 98, 8);
const brandPrimaryDark = Color(0xFFB9FF70);

FThemeData customZincLight() {
  const colors = FColors(
    brightness: Brightness.light,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    barrier: Color(0x33000000),
    background: Color(0xFFFFFFFF),
    foreground: Color(0xFF09090B),
    primary: brandPrimaryLight,
    primaryForeground: Colors.white,
    secondary: Color(0xFFF4F4F5),
    secondaryForeground: Color(0xFF18181B),
    muted: Color(0xFFF4F4F5),
    mutedForeground: Color(0xFF71717A),
    destructive: Color(0xFFEF4444),
    destructiveForeground: Color(0xFFFAFAFA),
    error: Color(0xFFEF4444),
    errorForeground: Color(0xFFFAFAFA),
    border: Color(0xFFE4E4E7),
  );

  final typography = _typography(colors: colors);
  final style = _style(colors: colors, typography: typography);

  return FThemeData(
    colors: colors,
    typography: typography,
    style: style,
    textFieldStyle: textFieldStyle(
      colors: colors,
      style: style,
      typography: typography,
    ),
  );
}

/// Tema dark baseado no zinc
FThemeData customZincDark() {
  const colors = FColors(
    brightness: Brightness.dark,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    barrier: Color(0x33000000),
    background: Color(0xFF18181B),
    foreground: Color(0xFFFFFFFF),
    primary: brandPrimaryDark,
    primaryForeground: Colors.black,
    secondary: Color(0xFF27272A),
    secondaryForeground: Color(0xFFF4F4F5),
    muted: Color(0xFF27272A),
    mutedForeground: Color(0xFF71717A),
    destructive: Color(0xFFEF4444),
    destructiveForeground: Color(0xFFFAFAFA),
    error: Color(0xFFEF4444),
    errorForeground: Color(0xFFFAFAFA),
    border: Color(0xFF3F3F46),
  );

  final typography = _typography(colors: colors);
  final style = _style(colors: colors, typography: typography);

  return FThemeData(
    colors: colors,
    typography: typography,
    style: style,
    textFieldStyle: textFieldStyle(
      colors: colors,
      style: style,
      typography: typography,
    ),
  );
}

FTypography _typography({
  required FColors colors,
  String defaultFontFamily = 'DMSans',
}) => FTypography(
  xs: TextStyle(
    color: colors.foreground,
    fontFamily: defaultFontFamily,
    fontSize: 12,
    height: 1,
  ),
  sm: TextStyle(
    color: colors.foreground,
    fontFamily: defaultFontFamily,
    fontSize: 14,
    height: 1.25,
  ),
  base: TextStyle(
    color: colors.foreground,
    fontFamily: defaultFontFamily,
    fontSize: 16,
    height: 1.5,
  ),
  lg: TextStyle(
    color: colors.foreground,
    fontFamily: defaultFontFamily,
    fontSize: 18,
    height: 1.75,
  ),
  xl: TextStyle(
    color: colors.foreground,
    fontFamily: defaultFontFamily,
    fontSize: 20,
    height: 1.75,
  ),
  xl2: TextStyle(
    color: colors.foreground,
    fontFamily: defaultFontFamily,
    fontSize: 22,
    height: 2,
  ),
  xl3: TextStyle(
    color: colors.foreground,
    fontFamily: defaultFontFamily,
    fontSize: 30,
    height: 2.25,
  ),
  xl4: TextStyle(
    color: colors.foreground,
    fontFamily: defaultFontFamily,
    fontSize: 36,
    height: 2.5,
  ),
  xl5: TextStyle(
    color: colors.foreground,
    fontFamily: defaultFontFamily,
    fontSize: 48,
    height: 1,
  ),
  xl6: TextStyle(
    color: colors.foreground,
    fontFamily: defaultFontFamily,
    fontSize: 60,
    height: 1,
  ),
  xl7: TextStyle(
    color: colors.foreground,
    fontFamily: defaultFontFamily,
    fontSize: 72,
    height: 1,
  ),
  xl8: TextStyle(
    color: colors.foreground,
    fontFamily: defaultFontFamily,
    fontSize: 96,
    height: 1,
  ),
);

FStyle _style({
  required FColors colors,
  required FTypography typography,
}) => FStyle(
  formFieldStyle:
      FFormFieldStyle.inherit(colors: colors, typography: typography).copyWith(
        labelTextStyle: FWidgetStateMap.all(
          TextStyle(color: colors.foreground, fontWeight: .w500),
        ),
      ),
  focusedOutlineStyle: FFocusedOutlineStyle(
    color: colors.primary,
    borderRadius: FLerpBorderRadius.circular(32),
  ),
  iconStyle: IconThemeData(color: colors.primary, size: 20),
  tappableStyle: FTappableStyle(),
  borderRadius: FLerpBorderRadius.circular(32),
  borderWidth: 1,
  shadow: const [
    BoxShadow(color: Color(0x0d000000), offset: Offset(0, 1), blurRadius: 2),
  ],
);

extension AppTextFieldOverrides on FTextFieldStyle {
  FTextFieldStyle withAppOverrides({
    required FColors colors,
    double? labelBottomPadding,
  }) {
    return copyWith(
      cursorColor: colors.primary,
      contentTextStyle: contentTextStyle,
      hintTextStyle: hintTextStyle,
      counterTextStyle: counterTextStyle,
      labelPadding: labelBottomPadding != null
          ? EdgeInsets.only(bottom: labelBottomPadding)
          : labelPadding,
    );
  }

  /// Ajusta o tamanho da fonte do texto dentro do input
  /// Exemplo: withFontSize(typography: context.theme.typography, size: 'sm')
  FTextFieldStyle withBaseFontSize({
    required FTypography typography,
    String size = 'base', // 'xs', 'sm', 'base', 'lg', 'xl', etc.
  }) {
    final TextStyle baseStyle = switch (size) {
      'xs' => typography.xs,
      'sm' => typography.sm,
      'base' => typography.base,
      'lg' => typography.lg,
      'xl' => typography.xl,
      'xl2' => typography.xl2,
      'xl3' => typography.xl3,
      'xl4' => typography.xl4,
      'xl5' => typography.xl5,
      'xl6' => typography.xl6,
      'xl7' => typography.xl7,
      'xl8' => typography.xl8,
      _ => typography.base,
    };

    return copyWith(
      contentTextStyle: FWidgetStateMap({
        WidgetState.disabled: contentTextStyle
            .resolve({WidgetState.disabled})
            .copyWith(fontSize: baseStyle.fontSize, height: baseStyle.height),
        WidgetState.any: contentTextStyle
            .resolve({})
            .copyWith(fontSize: baseStyle.fontSize, height: baseStyle.height),
      }),
      hintTextStyle: FWidgetStateMap({
        WidgetState.disabled: hintTextStyle
            .resolve({WidgetState.disabled})
            .copyWith(fontSize: baseStyle.fontSize, height: baseStyle.height),
        WidgetState.any: hintTextStyle
            .resolve({})
            .copyWith(fontSize: baseStyle.fontSize, height: baseStyle.height),
      }),
      counterTextStyle: FWidgetStateMap({
        WidgetState.disabled: counterTextStyle
            .resolve({WidgetState.disabled})
            .copyWith(fontSize: baseStyle.fontSize, height: baseStyle.height),
        WidgetState.any: counterTextStyle
            .resolve({})
            .copyWith(fontSize: baseStyle.fontSize, height: baseStyle.height),
      }),
    );
  }
}
