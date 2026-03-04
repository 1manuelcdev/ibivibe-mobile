import 'package:flutter/material.dart';

class MainWrapper extends StatelessWidget {
  final bool hasTopPadding;
  final List<Widget> children;

  const MainWrapper({
    super.key,
    required this.children,
    this.hasTopPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24, hasTopPadding ? 24 : 0, 24, 32),
      child: Column(
        spacing: 24,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
