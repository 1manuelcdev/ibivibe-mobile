import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:forui/forui.dart';

// ignore_for_file: unnecessary_ignore
// ignore_for_file: avoid_redundant_argument_values

FSelectStyle selectStyle({
  required FColors colors,
  required FTypography typography,
  required FStyle style,
}) => FSelectStyle(
  selectFieldStyle: .inherit(
    colors: colors,
    typography: typography,
    style: style.copyWith(borderRadius: .circular(12)),
  ),
  iconStyle: IconThemeData(color: colors.mutedForeground, size: 18),
  searchStyle: .inherit(colors: colors, typography: typography, style: style),
  contentStyle: .inherit(
    colors: colors,
    typography: typography,
    style: style.copyWith(borderRadius: .circular(12)),
  ),
  emptyTextStyle: typography.sm,
);
