import 'package:forui/forui.dart';

// ignore_for_file: unnecessary_ignore
// ignore_for_file: avoid_redundant_argument_values
FDividerStyles dividerStyles({
  required FColors colors,
  required FStyle style,
}) => FDividerStyles(
  horizontalStyle: FDividerStyle(
    color: colors.border.withAlpha(156),
    padding: FDividerStyle.defaultPadding.horizontalStyle,
    width: style.borderWidth,
  ),
  verticalStyle: FDividerStyle(
    color: colors.border.withAlpha(156),
    padding: FDividerStyle.defaultPadding.verticalStyle,
    width: style.borderWidth,
  ),
);
